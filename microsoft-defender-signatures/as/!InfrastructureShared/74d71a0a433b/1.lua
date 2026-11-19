-- Threat: !InfrastructureShared
-- Name: 74d71a0a433b
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_HIGH)
mp.AddDeferredBMAction("SmsAsyncScanEvent", 2000)
return mp.INFECTED
