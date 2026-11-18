-- Threat: !InfrastructureShared
-- Name: 35dd70f541b51
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 == nil then
  return mp.CLEAN
end
MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
mp.AddDeferredBMAction("SmsAsyncScanEvent", 5000)
return mp.INFECTED
