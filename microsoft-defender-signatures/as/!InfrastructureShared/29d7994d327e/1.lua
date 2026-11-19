-- Threat: !InfrastructureShared
-- Name: 29d7994d327e
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
