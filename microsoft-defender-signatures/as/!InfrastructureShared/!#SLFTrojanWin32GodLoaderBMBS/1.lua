-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:Win32/GodLoaderBM.BS
-- Type: 13
-- Includes: LuaFuncHelper
-- MpAttributes: (RPF:TopLevelFile) & (BM_PCK_FILE)

local l_0_0 = "GODOT-PCK"
local l_0_1 = 3600
local l_0_2 = 15
AppendToRollingQueue(l_0_0, "godpck", 1, l_0_1, l_0_2)
return mp.INFECTED
