# L4D2 药抗趣味插件包

这是一个基于 [Sirplease 药抗插件包](https://github.com/sirPlease/L4D2-Competitive-Rework) 的娱乐型插件包，你只需将文件覆盖进原插件包即可使用 。

---

## 🛠️ 使用说明
将本项目文件直接覆盖进Zonemod插件包。
我在`cfg/sharedplugins.cfg` 中做了出处注释，方便玩家自行提取插件。

---

## 📑 配置介绍 (点击查看详细参数)

<details>
<summary><b>Zone-WitchParty 女巫派对</b></summary>
<blockquote>

**生还者：** 
安全室随机刷新两把近战；移除所有冲锋枪，仅保留单喷（备弹 100）并新增鸟狙（属性同 EQMod）。
1 推CD。
当一名生还者倒地时，会立即生成一只 Witch。

**感染者：** 
Witch解除生成限制，每 10s 生成一只（上限 4 只）；秒杀 Witch 额外得 10 分；距离生还者 1500 码外会被自动处死。
仅保留 Hunter 和 Tank，移除其他所有特感。
Hunter高扑伤害上限解锁至 50。
</blockquote>
</details>

<details>
<summary><b>Zone-Advanced 进阶包抗</b></summary>
<blockquote>
将止疼药替换为医疗包，采用 **DRDK 评分机制**。
</blockquote>
</details>

<details>
<summary><b>ZoneMod Quad 四控狂欢</b></summary>
<blockquote>
移除了 Boomer 和 Spitter，感染者阵营现在最多可同时拥有 2 只 Hunter 。
</blockquote>
</details>

<details>
<summary><b>ZoneMod 1v1 NO Jockey</b></summary>
<blockquote>
Zonemod的1v1，移除了 Jockey。
</blockquote>
</details>

<details>
<summary><b>ZoneMod 1v4 练习模式</b></summary>
<blockquote>
类似于药役的 1vN 模式，对手为四名真人玩家。
支持无限重开，适合高强度抗压练习。
</blockquote>
</details>

---

## 🧩 部分插件介绍
<details>
<summary><b>公告插件 (advertisements.smx)</b></summary>
<blockquote>
在聊天框左下角定时发布系统信息。
配置路径：`configs/advertisements.txt`。
</blockquote>
</details>

<details>
<summary><b>跳舞插件 (fornite_l4d.smx)</b></summary>
<blockquote>
聊天框输入 `!dance` 即可开启跳舞动作。
使用此插件必须安装对应的资源包（已包含在本项目 `models` 文件夹中）。
如果因为此插件无法加入服务器，请找他人索要资源包，或在游戏设置中：`多人联机` -> `自定义服务器内容` -> 设置为 `无`。
</blockquote>
</details>

<details>
<summary><b>刷物与管理 (all4dead2.smx / l4d2_spawn_props.smx)</b></summary>
<blockquote>
管理员专用工具，用于手动生成特感、物品或地图装饰。
</blockquote>
</details>

<details>
<summary><b>投票/管理员回血 (admin_hp.smx)</b></summary>
<blockquote>
恢复生还者生命值，默认仅限管理员使用。
已将其整合至投票插件中，无管理员权限的玩家也可以发起投票回血。
</blockquote>
</details>

<details>
<summary><b>旁观前缀 (l4d_spectator_prefix.smx)</b></summary>
<blockquote>
自动为旁观者名字添加 `(S)` 前缀，进入旁观位即可查看效果。
</blockquote>
</details>

<details>
<summary><b>分差输出 (l4d2_score_difference.smx)</b></summary>
<blockquote>
对局结束后在左下角输出两队的分数差距。
</blockquote>
</details>

<details>
<summary><b>特感犯病提醒 (l4d_pig_infected_notify.smx)</b></summary>
<blockquote>
特感出现操作失误（犯病）时，会在左下角弹出实时提示。
</blockquote>
</details>

<details>
<summary><b>旁观透视增强 (l4d2_spectating_cheat.smx)</b></summary>
<blockquote>
优化旁观者视野，使其能更好地看到特感的位置。
</blockquote>
</details>

<details>
<summary><b>坦克表现统计 (l4d2_tank_facts_announce.smx)</b></summary>
<blockquote>
克局结束后自动播报 Tank 的表现数据（例如打中了多少拳，砸中了几次石头等）。
</blockquote>
</details>

<details>
<summary><b>友军伤害报告 (l4dffannounce.smx)</b></summary>
<blockquote>
实时显示队友之间的伤害情况，让你看清是谁在黑枪。
</blockquote>
</details>

<details>
<summary><b>Mixmap 随机地图插件 (mixmap.smx)</b></summary>
<blockquote>
每章地图（campaign）最多重复出现两张地图（map），支持自定义数量。
每章地图结束后，系统会自动进行当前图池的 mixmap。

**常用指令 (投票启用)：**
* `!mixmap`：启用默认图池（剔除 c9/c14/c13） 。
* `!mixmap do`：启用打乱顺序的默认图池（m2-m4） 顺序随机。
* `!mixmap of`：启用全官方图池（含 c9/c14/c13） 。
* `!mixmap ufo`：启用三方对抗地图池（包含 14 张常用三方图）。
* `!stopmixmap`：投票关闭 Mixmap 。
* `!maplist`：查看当前游玩的地图列表 。

**地图池逻辑：**
为了保证换图通畅，m1（关卡 1）和救援关的位置保持固定，仅中间关卡参与混洗 。
支持一代官方图（fo）或二代官方图（so）的独立混洗 。
</blockquote>
</details>

<details>
<summary><b>复活插件 (l4d_sm_respawn.smx)</b></summary>
<blockquote>
用于复活生还者，该功能仅限管理员使用。
</blockquote>
</details>

<details>
<summary><b>安全区侏儒 (saferoom_gnome.smx)</b></summary>
<blockquote>
在准备阶段时，安全区内会刷出一个侏儒供玩家娱乐，比赛正式开始后侏儒会自动消失。
</blockquote>
</details>

<details>
<summary><b>激光弹道显示 (l4d_laser_sp.smx)</b></summary>
<blockquote>
在准备阶段开枪时会显示激光弹道，方便观察弹道轨迹，比赛正式开始后该效果自动消失。
</blockquote>
</details>

<details>
<summary><b>爬墙插件 (l4d_climb.smx)</b></summary>
<blockquote>
在准备阶段时，生还者对着墙壁按住 <b>E</b> 键，可以像蜘蛛侠一样在墙上爬行；比赛正式开始后该功能消失。
</blockquote>
</details>

<details>
<summary><b>跳跃光圈特效 (l4d_jump_beamring.smx)</b></summary>
<blockquote>
在准备阶段时，生还者跳跃时脚下会出现环状光圈特效；比赛正式开始后效果消失。
</blockquote>
</details>

<details>
<summary><b>死亡灵魂升天 (l4d_death_soul.smx)</b></summary>
<blockquote>
生还者被击杀死亡后，会出现灵魂升天的视觉特效。
</blockquote>
</details>

<details>
<summary><b>选队长分队 (l4d2_mix.smx)</b></summary>
<blockquote>
传统的对抗选人插件，支持通过选队长的方式进行公平分队。
</blockquote>
</details>

<details>
<summary><b>坦克让位 (l4d2_tank_swap.smx)</b></summary>
<blockquote>
不敢玩 Tank 或者想把位置让给大神？该插件允许你将 Tank 控制权转让给其他队友。
</blockquote>
</details>

<details>
<summary><b>准备阶段 Hunter 跳 (l4d_fyzb_en_v20.smx)</b></summary>
<blockquote>
在准备阶段时，生还者同时按下 <b>Shift + 空格</b> 即可模仿 Hunter 进行高跳；比赛正式开始后该功能消失。
</blockquote>
</details>

<details>
<summary><b>队友击杀音效 (l4d_announcer_killing_spree.smx)</b></summary>
<blockquote>
当你亲手击杀队友时，系统会播放特定的音效。该功能需要音效包支持（已包含在本项目 <code>sound</code> 文件夹中）。
</blockquote>
</details>

<details>
<summary><b>服务器中文名修改 (l4d_DynamicHostname.smx)</b></summary>
<blockquote>
支持将服务器名称修改为中文。
<br><b>配置文件路径：</b><code>configs/hostname/server_hostname.txt</code>
</blockquote>
</details>

<details>
<summary><b>AI 特感自定义名称 (l4d2_SI_random_name.smx)</b></summary>
<blockquote>
可以为 AI 操控的特感（包括 Tank）设置自定义昵称。
<br><b>配置文件路径：</b><code>configs/SI_names.txt</code>
</blockquote>
</details>

<details>
<summary><b>玩家时长查询 (l4d2_player_time.smx)</b></summary>
<blockquote>
实用的“查成分”插件，用于查看服务器内玩家的游戏时长。
</blockquote>
</details>

<details>
<summary><b>自定义投票插件 (l4d2_vote.smx)</b></summary>
<blockquote>
投票管理插件。
<br><b>配置文件路径：</b><code>configs/l4d2_vote.txt</code>
</blockquote>
</details>

<details>
<summary><b>地图重置插件 (sm_restartmap.smx)</b></summary>
<blockquote>
用于重置当前地图。管理员可直接使用指令sm_restartmap或者!restartmap；非管理员玩家需发起投票重置。
<br><b>注意：</b>执行重置后，双方当前关卡的分数将会清零。
</blockquote>
</details>

<details>
<summary><b>脏话屏蔽插件 (BieShuoZangHua.smx)</b></summary>
<blockquote>
自动识别并屏蔽聊天框内的不文明用语。
<br><b>词库配置路径：</b><code>data/BieShuoZangHua.txt</code>
</blockquote>
</details>

---

## 🐞 Bug 反馈与交流
由于本人目前没有服务器进行测试，若遇到 Bug 请联系我进行反馈 ：
* **QQ:** 2803584304 

---