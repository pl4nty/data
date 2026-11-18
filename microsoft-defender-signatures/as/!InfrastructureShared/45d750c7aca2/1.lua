-- Threat: !InfrastructureShared
-- Name: 45d750c7aca2
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
  return mp.INFECTED
end
return mp.CLEAN
