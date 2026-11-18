-- Threat: !InfrastructureShared
-- Name: 39d7d08091e5
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
local l_0_2 = string.lower(l_0_1)
if l_0_2 == nil then
  return mp.CLEAN
end
MpCommon.SetPersistContextNoPath("DllFromOdbcAction", {l_0_2}, 100)
return mp.CLEAN
