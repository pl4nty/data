-- Threat: !InfrastructureShared
-- Name: 3bd7b03527b5
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 == nil then
  return mp.CLEAN
end
l_0_1 = string.lower(l_0_1)
if string.sub(l_0_1, -14, -2) == ",visibleentry" then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
  return mp.INFECTED
end
return mp.CLEAN
