-- Threat: !InfrastructureShared
-- Name: 91d7c84669fc
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
  mp.SMSAsyncScan(l_0_0.ppid)
  return mp.INFECTED
end
return mp.CLEAN
