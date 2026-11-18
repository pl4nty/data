-- Threat: !InfrastructureShared
-- Name: 7fd7542410dc
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
