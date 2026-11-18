-- Threat: !InfrastructureShared
-- Name: ddd7fa2d9577
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
  mp.SMSAsyncScan(l_0_0.ppid)
end
return mp.LOWFI
