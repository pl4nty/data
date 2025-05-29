-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\!#SLFTrojanWin32GodLoaderBMBS\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "GODOT-PCK"
local l_0_1 = 3600
local l_0_2 = 15
AppendToRollingQueue(l_0_0, "godpck", 1, l_0_1, l_0_2)
return mp.INFECTED

