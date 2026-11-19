-- Threat: !InfrastructureShared
-- Name: 91d7116c00ae
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_HIGH)
mp.AddDeferredBMAction("SmsAsyncScanEvent", 5000)
return mp.INFECTED
