-- Threat: !InfrastructureShared
-- Name: !#SLF:Trojan:PowerShell/SuspiciousPSCommandDetect.C
-- Type: 13
-- Includes: TechniqueTracker
-- MpAttributes: Lua:CloudBlockLevelGT3 & SCPT:PowerShell/ExecutionPolicyBypass & (SCPT:PowerShell/EncodedCommand | SCRIPT:EncodedCommand) & (SCPT:PowerShell/NoExit | SCPT:PowerShell/Hidden) & MpIsPowerShellAMSIScan & !BM_MZ_FILE & !SCRIPT:amsipeexclusion.A & Lua:TT:DetectionThresholdMet

local l_0_0 = mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON)
if l_0_0 == mp.SCANREASON_AMSI then
  local l_0_1, l_0_2 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_APPNAME)
  if l_0_1 and l_0_2 then
    local l_0_3, l_0_4 = pcall(mp.get_contextdata, mp.CONTEXT_DATA_AMSI_CONTENTNAME)
    if l_0_3 and l_0_4 == nil then
      TrackPidAndTechnique("AMSI", "T1204", "UserExecution")
      return mp.INFECTED
    end
  end
  return mp.CLEAN
end
return mp.CLEAN
