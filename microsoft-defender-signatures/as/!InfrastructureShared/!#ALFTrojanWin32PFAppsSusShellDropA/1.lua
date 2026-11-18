-- Threat: !InfrastructureShared
-- Name: !#ALF:Trojan:Win32/PFAppsSusShellDrop.A
-- Type: 13
-- Includes: ResearchData, LuaFuncHelper, AppomalyHelpers, BMLuaLib
-- MpAttributes: CommonShellExt2 | CommonBatExt | Lua:TopLevelUnsigned | AGGR:UnSignedExecInArchive | AGGR:CommonBatExtInArchive | AGGR:CommonShellExtInArchive
-- ProcessAttributes: PFAppTracked | inherit:PFAppTracked | PFApp_Parent | inherit:PFApp_Parent

local l_0_0 = mp.getfilename()
local l_0_1 = mp.ContextualExpandEnvironmentVariables(l_0_0)
if l_0_1 and mp.IsKnownFriendlyFile(l_0_1, true, false) then
  return mp.CLEAN
end
local l_0_2 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
if not l_0_2 then
  return mp.CLEAN
end
local l_0_3 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSNAME)
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESSDEVICEPATH)
if not l_0_3 or not l_0_4 then
  return mp.CLEAN
end
local l_0_5 = MpCommon.PathToWin32Path(l_0_4)
local l_0_6 = l_0_5 .. "\\" .. l_0_3
local l_0_7 = mp.GetProcessCommandLine(l_0_2) or ""
local l_0_8 = {
  "sunbelt.*sbscan.exe",
  "AppData\\Local\\Microsoft\\OneDrive\\OneDrive.exe\" /background"
}
if contains(l_0_6 .. l_0_7, l_0_8, false) then
  return mp.CLEAN
end
local l_0_9, l_0_10 = GetAppomalyProcessAttribute(l_0_2)
if not l_0_10 then
  return mp.CLEAN
end
local l_0_11 = MpCommon.PathToWin32Path(l_0_1)
if not l_0_11 then
  return mp.CLEAN
end
local l_0_12 = l_0_11:match("([^\\]+)$")
if l_0_12 and contains(l_0_12, {
  ".exe",
  ".dll",
  ".ps1",
  ".bat"
}) then
  AppendToRollingQueue("PFApp_FileDropped_Path", string.lower(l_0_11), l_0_2, 1800, 500, 1)
end
local l_0_13 = safeJsonDeserialize(l_0_10)
if not l_0_13 then
  return mp.CLEAN
end
local l_0_14 = {}
local l_0_15 = 0
l_0_14.FileAttributes = ""
local l_0_16 = mp.enum_mpattributesubstring("")
if l_0_16 and 0 < #l_0_16 then
  local l_0_17 = {}
  for l_0_18, l_0_19 in ipairs(l_0_16) do
    local l_0_20, l_0_21 = MpCommon.StringRegExpSearch("((alf:|slf:|tel:|detection:).*(webshell|shellcode|shellexecute|downloader|exploit|backdoor))", string.lower(l_0_19))
    if l_0_20 and #l_0_17 < 15 then
      table.insert(l_0_17, l_0_19)
    end
  end
  if 0 < #l_0_17 then
    l_0_17 = table_dedup(l_0_17)
    l_0_15 = l_0_15 + #l_0_17 * 10
    l_0_14.FileAttributes = "[" .. table.concat(l_0_17, "|") .. "]"
  end
end
local l_0_22 = GetDirectoryRiskScore(l_0_11)
l_0_14.DirectoryGenScore = l_0_22
local l_0_23 = NormalizeFileName(l_0_12)
local l_0_24, l_0_25 = l_0_12:match("^(.+)%.([^%.]+)$")
l_0_14.FileExtensionScore = GetFileExtensionScore(l_0_25)
l_0_15 = l_0_15 + (l_0_14.FileExtensionScore or 0)
local l_0_26 = string.match(l_0_11, "^(.*)\\")
local l_0_27 = NormalizeDirectory(l_0_26)
l_0_14.NormalizedDirectory = l_0_27
l_0_14.Directory = l_0_26
l_0_14.AnomalousDirectory = false
local l_0_28 = l_0_13.AppName
if not l_0_28 then
  return mp.CLEAN
end
local l_0_29 = "MarkerRecord_" .. l_0_28
if IsPotentiallyClean("CleanFileDrop", l_0_28, l_0_12) then
  return mp.CLEAN
end
if l_0_27 then
  local l_0_30 = l_0_28 .. ";" .. l_0_27
  local l_0_31, l_0_32, l_0_33 = AnomalyTableCheck("Appomaly_File_Directory", l_0_30, 30, l_0_29)
  if l_0_31 and not l_0_32 then
    l_0_14.AnomalousDirectory = true
    l_0_22 = l_0_22 + 5
  end
  l_0_14.AnomalousDirectory_tblInfo = l_0_33
end
l_0_14.AnomalousFileExtension = false
l_0_14.AnomalousFileName = false
if l_0_12 then
  l_0_14.FileName_Normalized = l_0_23
  l_0_14.FileName = l_0_12
  l_0_14.FileName_Randomness_Score = GetFileNameRandomnessScore(l_0_12)
  local l_0_34, l_0_35, l_0_36, l_0_37, l_0_38 = pcall(computeStringScores, l_0_12)
  local l_0_39 = {}
  l_0_39.ConsonantVowelsRepetition = l_0_35
  l_0_39.ConsonantVowelsRepetitionRatio = l_0_36
  l_0_39.CaseSwitches = l_0_37
  l_0_39.LetterNumberAlternations = l_0_38
  if l_0_34 and (0 < l_0_36 and 1 < l_0_35 or 3 < l_0_38 or 5 < l_0_37) then
    l_0_39.FileName_String_Score_Malicious = true
  end
  l_0_14.FileName_String_Score = l_0_39
  if l_0_23 then
    local l_0_40 = l_0_28 .. ";" .. l_0_23
    local l_0_41, l_0_42, l_0_43 = AnomalyTableCheck("Appomaly_File_Name", l_0_40, 30, l_0_29)
    if l_0_41 and not l_0_42 then
      l_0_14.AnomalousFileName = true
      l_0_15 = l_0_15 + 10
    end
    l_0_14.AnomalousFileName_tblInfo = l_0_43
  end
  local l_0_44, l_0_45 = l_0_12:match("^(.+)%.([^%.]+)$")
  if l_0_45 then
    local l_0_46 = l_0_28 .. ";" .. l_0_45
    local l_0_47, l_0_48, l_0_49 = AnomalyTableCheck("Appomaly_File_Extension", l_0_46, 30, l_0_29)
    if l_0_47 and not l_0_48 then
      l_0_14.AnomalousFileExtension = true
      l_0_15 = l_0_15 + 10
    end
    l_0_14.AnomalousFileExtension_tblInfo = l_0_49
  end
end
l_0_14.FileDropScore = l_0_15
local l_0_50 = l_0_13.Score
local l_0_51, l_0_52
if 10 <= l_0_15 then
  l_0_51 = "SuspFileDrop[" .. l_0_2:match("pid:(%d+)") .. "][" .. l_0_27 .. "][" .. l_0_23 .. "]"
  l_0_52 = l_0_15
  IncreaseProcessAnomalyScore(l_0_2, l_0_52, l_0_51, l_0_9, l_0_14)
elseif 0 < l_0_50 and 5 < l_0_15 then
  l_0_51 = "FileDrop[" .. l_0_2:match("pid:(%d+)") .. "][" .. l_0_27 .. "][" .. l_0_23 .. "]"
  l_0_52 = l_0_15
  IncreaseProcessAnomalyScore(l_0_2, l_0_52, l_0_51, l_0_9, l_0_14)
end
if l_0_14.AnomalousDirectory then
  local l_0_53 = l_0_28
  local l_0_54 = l_0_27
  local l_0_55 = 1
  local l_0_56 = "FileDropInSuspDirectory"
  if hasSeenBefore(l_0_53, l_0_54, l_0_55, l_0_56) then
    return mp.CLEAN
  end
  l_0_51 = "SuspDirectoryDrop[" .. l_0_2:match("pid:(%d+)") .. "][" .. l_0_27 .. "]"
  l_0_52 = 5
  IncreaseProcessAnomalyScore(l_0_2, l_0_52, l_0_51, l_0_9, l_0_14)
end
if l_0_51 then
  l_0_14.ProcessAttribute = l_0_13
  l_0_14.FilePath = l_0_0
  l_0_14.Parents = add_parents_mp()
  local l_0_57, l_0_58 = safeJsonSerialize(l_0_14, 150, nil, true)
  if l_0_57 then
    MpCommon.BmTriggerSig(l_0_2, "LUA:PFAppsSusShellDrop", l_0_57)
    return mp.INFECTED
  else
    set_research_data("Error", l_0_58, false)
    return mp.INFECTED
  end
end
return mp.CLEAN
