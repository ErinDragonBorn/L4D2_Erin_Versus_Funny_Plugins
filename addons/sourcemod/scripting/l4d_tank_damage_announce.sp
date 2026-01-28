#pragma semicolon 1
#include <colors>
#include <sdktools>
#include <sourcemod>
#include <sdkhooks>

#define TEAM_SURVIVOR     2
#define TEAM_INFECTED     3
#define ZOMBIECLASS_TANK  8

bool g_bEnabled = true;
bool g_bIsTankInPlay = false;
bool bPrintedHealth = false;

int g_iTankClient = 0;
int g_iLastTankHealth = 0;
int g_iDamage[MAXPLAYERS + 1];
float g_fMaxTankHealth = 6000.0;

// 全局变量存储坦克名字（含AI后缀）
char g_sTankNameForPrint[MAX_NAME_LENGTH + 8]; 

public Plugin myinfo = 
{
	name = "L4D2 Tank Damage Announce (Perfect Clean)",
	author = "Erin & Griffin",
	description = "Announce damage dealt to tanks with AI naming support",
	version = "1.4"
};

public void OnPluginStart()
{
	LoadTranslations("l4d_tank_damage_announce.phrases");
	HookEvent("tank_spawn", Event_TankSpawn);
	HookEvent("player_death", Event_PlayerDeath);
	HookEvent("round_start", Event_RoundStart);
	HookEvent("round_end", Event_RoundEnd);

	for (int i = 1; i <= MaxClients; i++) 
	{ 
		if (IsClientInGame(i)) SDKHook(i, SDKHook_OnTakeDamage, OnTakeDamage);
	}
}

public void OnClientPutInServer(int client)
{
	SDKHook(client, SDKHook_OnTakeDamage, OnTakeDamage);
}

public void Event_RoundStart(Event event, const char[] name, bool dontBroadcast)
{
	g_bIsTankInPlay = false;
	g_iTankClient = 0;
	for (int i = 1; i <= MaxClients; i++) g_iDamage[i] = 0;
}

public void Event_TankSpawn(Event event, const char[] name, bool dontBroadcast)
{
	int client = GetClientOfUserId(event.GetInt("userid"));
	g_iTankClient = client;
	g_bIsTankInPlay = true;
	bPrintedHealth = false;
	g_fMaxTankHealth = float(GetClientHealth(client));
}

public void Event_PlayerDeath(Event event, const char[] name, bool dontBroadcast)
{
	int victim = GetClientOfUserId(event.GetInt("userid"));
	if (victim <= 0 || !IsClientInGame(victim)) return;

	if (GetEntProp(victim, Prop_Send, "m_zombieClass") == ZOMBIECLASS_TANK)
	{
		GetClientName(victim, g_sTankNameForPrint, sizeof(g_sTankNameForPrint));
		if (IsFakeClient(victim))
		{
			Format(g_sTankNameForPrint, sizeof(g_sTankNameForPrint), "%s(AI)", g_sTankNameForPrint);
		}

		g_iLastTankHealth = 0;
		g_bIsTankInPlay = false;
		CreateTimer(0.1, Timer_PrintTankDamage);
	}
}

public Action Timer_PrintTankDamage(Handle timer)
{
	PrintTankDamage();
	return Plugin_Stop;
}

public void Event_RoundEnd(Event event, const char[] name, bool dontBroadcast)
{
	if (g_bIsTankInPlay)
	{
		int tankclient = GetTankClient();
		if (tankclient > 0)
		{
			g_iLastTankHealth = GetClientHealth(tankclient);
			GetClientName(tankclient, g_sTankNameForPrint, sizeof(g_sTankNameForPrint));
			if (IsFakeClient(tankclient)) Format(g_sTankNameForPrint, sizeof(g_sTankNameForPrint), "%s(AI)", g_sTankNameForPrint);
		}
		PrintRemainingHealth();
		PrintTankDamage();
	}
}

void PrintRemainingHealth()
{
	bPrintedHealth = true;
	if (!g_bEnabled) return;
	CPrintToChatAll("%t %t", "Tag", "HealthRemaining", g_sTankNameForPrint, g_iLastTankHealth);
}

void PrintTankDamage()
{
	if (!g_bEnabled) return;

	if (!bPrintedHealth)
	{
		CPrintToChatAll("%t %t", "Tag", "DealtToTank", g_sTankNameForPrint);
	}

	int iMaxDamage = 0;
	for (int i = 1; i <= MaxClients; i++)
	{
		if (g_iDamage[i] > iMaxDamage) iMaxDamage = g_iDamage[i];
	}

	if (iMaxDamage > 0)
	{
		for (int i = 1; i <= MaxClients; i++)
		{
			if (g_iDamage[i] > 0 && IsClientInGame(i))
			{
				int iPercent = RoundToNearest((float(g_iDamage[i]) / g_fMaxTankHealth) * 100.0);
				CPrintToChatAll("%t %t", "Tag", "PercentDamage", g_iDamage[i], iPercent, i);
			}
			g_iDamage[i] = 0;
		}
	}
}

public Action OnTakeDamage(int victim, int &attacker, int &inflictor, float &damage, int &damagetype)
{
	if (g_bIsTankInPlay && victim == g_iTankClient && attacker > 0 && attacker <= MaxClients && IsClientInGame(attacker) && GetClientTeam(attacker) == TEAM_SURVIVOR)
	{
		g_iDamage[attacker] += RoundToFloor(damage);
	}
	return Plugin_Continue;
}

int GetTankClient()
{
	if (g_iTankClient > 0 && IsClientInGame(g_iTankClient)) return g_iTankClient;
	for (int i = 1; i <= MaxClients; i++)
	{
		if (IsClientInGame(i) && GetClientTeam(i) == TEAM_INFECTED && IsPlayerAlive(i) && GetEntProp(i, Prop_Send, "m_zombieClass") == ZOMBIECLASS_TANK)
			return i;
	}
	return 0;
}