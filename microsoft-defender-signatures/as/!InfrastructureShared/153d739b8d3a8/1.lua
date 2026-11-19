-- Threat: !InfrastructureShared
-- Name: 153d739b8d3a8
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
return mp.INFECTED
