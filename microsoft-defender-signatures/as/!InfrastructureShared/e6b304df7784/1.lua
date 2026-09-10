-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\e6b304df7784\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = "PyArmorRQ"
local l_0_1 = (this_sigattrlog[1]).utf8p1
local l_0_2 = GetRollingQueueKeyValue(l_0_0, l_0_1)
if not isnull(l_0_2) then
  return mp.CLEAN
end
AppendToRollingQueue(l_0_0, l_0_1, 1, 86400)
return mp.INFECTED

