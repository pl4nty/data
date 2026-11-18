-- Threat: !InfrastructureShared
-- Name: !#Lua:Quiltran.H
-- Type: 13

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if not mp.get_mpattribute("SLFPER:MSIL/Quiltran.H!amsi") then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 ~= nil then
  MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
end
return mp.INFECTED
