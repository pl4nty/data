-- Threat: !InfrastructureShared
-- Name: 52d764b0f95e
-- Type: 21
-- Includes: LuaFuncHelper

local l_0_0 = mp.GetScannedPPID()
if not l_0_0 then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if not l_0_1 then
  return mp.CLEAN
end
AppendToRollingQueue("disallowAv", l_0_1, l_0_0, 3600)
local l_0_2 = GetRollingQueueCount("disallowAv")
if not l_0_2 then
  return mp.CLEAN
end
if 2 <= l_0_2 then
  return mp.INFECTED
end
return mp.CLEAN
