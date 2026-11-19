-- Threat: !InfrastructureShared
-- Name: 23d76fb133f1
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
local l_0_1 = mp.GetProcessCommandLine(l_0_0)
if l_0_1 ~= nil and string.find(l_0_1, "mshta", 1, true) ~= nil and (string.find(l_0_1, ".hta", 1, true) == nil or string.find(l_0_1, "http", 1, true) ~= nil) then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
end
return mp.CLEAN
