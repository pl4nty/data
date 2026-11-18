-- Threat: !InfrastructureShared
-- Name: c1d7fee6189c
-- Type: 21

local l_0_0 = mp.GetScannedPPID()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
mp.AddDeferredBMAction("SmsAsyncScanEvent", 3000)
return mp.INFECTED
