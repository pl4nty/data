-- Threat: !InfrastructureShared
-- Name: 63d72f8ff882
-- Type: 21

local l_0_0 = mp.GetParentProcInfo()
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0.ppid, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
