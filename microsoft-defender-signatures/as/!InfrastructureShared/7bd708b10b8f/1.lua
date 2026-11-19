-- Threat: !InfrastructureShared
-- Name: 7bd708b10b8f
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
mp.AddDeferredBMAction("SmsAsyncScanEvent", 10000)
return mp.INFECTED
