-- Threat: !InfrastructureShared
-- Name: 3fd7d00c4690
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_LOW)
end
return mp.INFECTED
