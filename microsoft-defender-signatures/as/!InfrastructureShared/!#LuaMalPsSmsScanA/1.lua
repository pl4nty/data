-- Threat: !InfrastructureShared
-- Name: !#Lua:MalPsSmsScan.A
-- Type: 13
-- MpAttributes: SLFPER:PsObfus.A & MpIsPowerShellAMSIScan

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_AMSI_OPERATION_PPID)
if l_0_0 ~= nil then
  if mp.get_mpattribute("SCRIPT:PS.Memset") and mp.get_mpattribute("SCRIPT:PS.Gt0x1000") then
    if mp.get_mpattribute("SCRIPT:PS.AddType") and mp.get_mpattribute("SCRIPT:PS.Calloc") and mp.get_mpattribute("SCRIPT:PS.CreateThread") then
      mp.set_mpattribute("MpDisableCaching")
      local l_0_1 = {}
      table.insert(l_0_1, l_0_0)
      MpCommon.SetPersistContextNoPath("Lua:MalPsSmsScanAmsi", l_0_1, 0)
    end
    MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_HIGH)
  else
    MpCommon.RequestSmsOnProcess(l_0_0, MpCommon.SMS_SCAN_MED)
  end
end
return mp.INFECTED
