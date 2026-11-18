-- Threat: !InfrastructureShared
-- Name: !#BLKEXC:92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b
-- Type: 24
-- Includes: HipsLuaInfra
-- MpAttributes: MpIsOfficeVbaAMSIScan & (SCPT_Win32API_Pat.AMSI | SCPT_Win32Dll_CopyPat.AMSI) & !Lua:OfficeVBASkipKnownCleanOriginalFile & !ASRWin32ApiMacroExclusion

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_AMSI then
  return mp.CLEAN
end
if not mp.IsHipsRuleEnabled("92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
local l_0_0 = GetCtxOfficeProc()
if l_0_0 ~= "productivity" and l_0_0 ~= "productivity2" then
  return mp.CLEAN
end
local l_0_1
l_0_1 = GetNonVfoAmsiContentNamePathIfExistOnMachine()
if l_0_1 ~= nil and mp.IsPathExcludedForHipsRule(l_0_1, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
l_0_1 = GetNonVfoScannedFilePathIfExistOnMachine()
if l_0_1 ~= nil and mp.IsPathExcludedForHipsRule(l_0_1, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
local l_0_2
l_0_2 = GetInvolvedFileInCmdLnIfExistOnMachineAMSI()
if l_0_2 ~= nil and mp.IsPathExcludedForHipsRule(l_0_2, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
return mp.INFECTED
