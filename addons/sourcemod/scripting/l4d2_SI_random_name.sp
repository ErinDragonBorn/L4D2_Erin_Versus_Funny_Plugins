#include <sourcemod>
#include <sdktools>

public Plugin myinfo = 
{
    name = "全特感改名",
    author = "Erin",
    description = "给你的AI特感改名字",
    version = "1.0"
};

Handle g_kvNames;
int g_NameCount = 0;

public void OnPluginStart()
{
    // 针对 Tank 特殊处理，延迟一点点时间再改名
    HookEvent("tank_spawn", Event_TankSpawn);
    HookEvent("player_spawn", Event_NameAI);
}

public void OnMapStart()
{
    LoadNamesConfig();
}

void LoadNamesConfig()
{
    if (g_kvNames != null) CloseHandle(g_kvNames);
    g_kvNames = CreateKeyValues("SI_Names");
    char sPath[PLATFORM_MAX_PATH];
    BuildPath(Path_SM, sPath, sizeof(sPath), "configs/SI_names.txt");
    
    if (!FileExists(sPath))
    {
        SetFailState("错误：找不到配置文件 %s", sPath);
    }
    
    FileToKeyValues(g_kvNames, sPath);
    
    g_NameCount = 0;
    KvRewind(g_kvNames);
    if (KvJumpToKey(g_kvNames, "Students"))
    {
        if (KvGotoFirstSubKey(g_kvNames, false))
        {
            do {
                g_NameCount++;
            } while (KvGotoNextKey(g_kvNames, false));
        }
    }
    LogMessage("成功加载名字库，共检测到 %d 位女主。", g_NameCount);
}

// 专门处理 Tank 生成，延迟 0.1 秒强制改名
public void Event_TankSpawn(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    if (client > 0 && IsClientInGame(client) && IsFakeClient(client))
    {
        CreateTimer(0.1, Timer_ApplyName, GetClientUserId(client), TIMER_FLAG_NO_MAPCHANGE);
    }
}

public void Event_NameAI(Event event, const char[] name, bool dontBroadcast)
{
    int client = GetClientOfUserId(event.GetInt("userid"));
    // 排除掉 Tank (由专用函数处理) 和 幸存者
    if (client > 0 && IsClientInGame(client) && IsFakeClient(client) && GetClientTeam(client) == 3)
    {
        char classname[32];
        GetEntityNetClass(client, classname, sizeof(classname));
        if (StrContains(classname, "Tank", false) == -1)
        {
            ApplyRandomName(client);
        }
    }
}

public Action Timer_ApplyName(Handle timer, int userid)
{
    int client = GetClientOfUserId(userid);
    if (client > 0 && IsClientInGame(client))
    {
        ApplyRandomName(client);
    }
    return Plugin_Stop;
}

void ApplyRandomName(int client)
{
    if (g_NameCount == 0) return;

    KvRewind(g_kvNames);
    if (KvJumpToKey(g_kvNames, "Students"))
    {
        char sKey[8], sRandomName[64];
        IntToString(GetRandomInt(1, g_NameCount), sKey, sizeof(sKey));
        KvGetString(g_kvNames, sKey, sRandomName, sizeof(sRandomName), "柚子厨");
        
        // 核心修复：使用 SetClientName 而非单纯修改 SetClientInfo
        // 这会强制向所有玩家同步新的名字
        SetClientName(client, sRandomName);
    }
}