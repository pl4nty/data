-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\52d764b0f95e\1.luac 

-- params : ...
-- function num : 0
local l_0_0 = (mp.GetScannedPPID)()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = (mp.GetProcessCommandLine)(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
AppendToRollingQueue("disallowAv", l_0_1, l_0_0, 3600)
local l_0_2 = GetRollingQueueCount("disallowAv")
if not l_0_2 then
  return mp.CLEAN
end
if l_0_2 >= 2 then
  return mp.INFECTED
end
return mp.CLEAN

