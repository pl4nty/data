-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:PowerShell/SuspiciousPSCommand.B
-- Type: 13
-- MpAttributes: Lua:CloudBlockLevelGT3 & SCPT:PowerShell/ExecutionPolicyBypass & (SCPT:PowerShell/EncodedCommand | SCRIPT:EncodedCommand) & SCPT:PowerShell/NonInteractive & SCPT:PowerShell/NonProfile & MpIsPowerShellAMSIScan & !BM_MZ_FILE & !SCRIPT:amsipeexclusion.A

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    if l_0_3 and l_0_4 == nil then
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
