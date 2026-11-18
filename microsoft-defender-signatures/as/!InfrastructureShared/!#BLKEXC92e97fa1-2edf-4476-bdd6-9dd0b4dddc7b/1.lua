-- Threat: !InfrastructureShared
-- Name: !#BLKEXC:92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b
-- Type: 24
-- Includes: HipsLuaInfra
-- MpAttributes: MpIsInMemoryScan & (SCRIPT:LoadWin32importsfromMacro | MHSTR:LoadWin32importsfromMacro) & !ASRWin32ApiMacroExclusion

if mp.get_contextdata(mp.CONTEXT_DATA_SCANREASON) ~= mp.SCANREASON_INMEMORY then
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
l_0_1 = GetNonVfoScannedFilePathIfExistOnMachine()
if l_0_1 ~= nil and mp.IsPathExcludedForHipsRule(l_0_1, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
local l_0_2
l_0_2 = GetInvolvedFileInCmdLnIfExistOnMachine()
if l_0_2 ~= nil and mp.IsPathExcludedForHipsRule(l_0_2, "92e97fa1-2edf-4476-bdd6-9dd0b4dddc7b") then
  return mp.CLEAN
end
return mp.INFECTED
