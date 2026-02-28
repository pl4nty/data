local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1
L0_1 = mp
L0_1 = L0_1.getfilename
L0_1 = L0_1()
L1_1 = mp
L1_1 = L1_1.ContextualExpandEnvironmentVariables
L2_1 = L0_1
L1_1 = L1_1(L2_1)
if L1_1 then
  L2_1 = mp
  L2_1 = L2_1.IsKnownFriendlyFile
  L3_1 = L1_1
  L4_1 = true
  L5_1 = false
  L2_1 = L2_1(L3_1, L4_1, L5_1)
  if L2_1 then
    L2_1 = mp
    L2_1 = L2_1.CLEAN
    return L2_1
  end
end
L2_1 = mp
L2_1 = L2_1.get_contextdata
L3_1 = mp
L3_1 = L3_1.CONTEXT_DATA_PROCESS_PPID
L2_1 = L2_1(L3_1)
if not L2_1 then
  L3_1 = mp
  L3_1 = L3_1.CLEAN
  return L3_1
end
L3_1 = mp
L3_1 = L3_1.get_contextdata
L4_1 = mp
L4_1 = L4_1.CONTEXT_DATA_PROCESSNAME
L3_1 = L3_1(L4_1)
L4_1 = mp
L4_1 = L4_1.get_contextdata
L5_1 = mp
L5_1 = L5_1.CONTEXT_DATA_PROCESSDEVICEPATH
L4_1 = L4_1(L5_1)
if not L3_1 or not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = MpCommon
L5_1 = L5_1.PathToWin32Path
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L6_1 = L5_1
L7_1 = "\\"
L8_1 = L3_1
L6_1 = L6_1 .. L7_1 .. L8_1
L7_1 = mp
L7_1 = L7_1.GetProcessCommandLine
L8_1 = L2_1
L7_1 = L7_1(L8_1)
if not L7_1 then
  L7_1 = ""
end
L8_1 = {}
L9_1 = "sunbelt.*sbscan.exe"
L10_1 = "AppData\\Local\\Microsoft\\OneDrive\\OneDrive.exe\" /background"
L8_1[1] = L9_1
L8_1[2] = L10_1
L9_1 = contains
L10_1 = L6_1
L11_1 = L7_1
L10_1 = L10_1 .. L11_1
L11_1 = L8_1
L12_1 = false
L9_1 = L9_1(L10_1, L11_1, L12_1)
if L9_1 then
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = GetAppomalyProcessAttribute
L10_1 = L2_1
L9_1, L10_1 = L9_1(L10_1)
if not L10_1 then
  L11_1 = mp
  L11_1 = L11_1.CLEAN
  return L11_1
end
L11_1 = MpCommon
L11_1 = L11_1.PathToWin32Path
L12_1 = L1_1
L11_1 = L11_1(L12_1)
if not L11_1 then
  L12_1 = mp
  L12_1 = L12_1.CLEAN
  return L12_1
end
L13_1 = L11_1
L12_1 = L11_1.match
L14_1 = "([^\\]+)$"
L12_1 = L12_1(L13_1, L14_1)
if L12_1 then
  L13_1 = contains
  L14_1 = L12_1
  L15_1 = {}
  L16_1 = ".exe"
  L17_1 = ".dll"
  L18_1 = ".ps1"
  L19_1 = ".bat"
  L15_1[1] = L16_1
  L15_1[2] = L17_1
  L15_1[3] = L18_1
  L15_1[4] = L19_1
  L13_1 = L13_1(L14_1, L15_1)
  if L13_1 then
    L13_1 = AppendToRollingQueue
    L14_1 = "PFApp_FileDropped_Path"
    L15_1 = string
    L15_1 = L15_1.lower
    L16_1 = L11_1
    L15_1 = L15_1(L16_1)
    L16_1 = L2_1
    L17_1 = 1800
    L18_1 = 500
    L19_1 = 1
    L13_1(L14_1, L15_1, L16_1, L17_1, L18_1, L19_1)
  end
end
L13_1 = safeJsonDeserialize
L14_1 = L10_1
L13_1 = L13_1(L14_1)
if not L13_1 then
  L14_1 = mp
  L14_1 = L14_1.CLEAN
  return L14_1
end
L14_1 = {}
L15_1 = 0
L14_1.FileAttributes = ""
L16_1 = mp
L16_1 = L16_1.enum_mpattributesubstring
L17_1 = ""
L16_1 = L16_1(L17_1)
if L16_1 then
  L17_1 = #L16_1
  if 0 < L17_1 then
    L17_1 = {}
    L18_1 = ipairs
    L19_1 = L16_1
    L18_1, L19_1, L20_1 = L18_1(L19_1)
    for L21_1, L22_1 in L18_1, L19_1, L20_1 do
      L23_1 = MpCommon
      L23_1 = L23_1.StringRegExpSearch
      L24_1 = "((alf:|slf:|tel:|detection:).*(webshell|shellcode|shellexecute|downloader|exploit|backdoor))"
      L25_1 = string
      L25_1 = L25_1.lower
      L26_1 = L22_1
      L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1 = L25_1(L26_1)
      L23_1, L24_1 = L23_1(L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1)
      if L23_1 then
        L25_1 = #L17_1
        if L25_1 < 15 then
          L25_1 = table
          L25_1 = L25_1.insert
          L26_1 = L17_1
          L27_1 = L22_1
          L25_1(L26_1, L27_1)
        end
      end
    end
    L18_1 = #L17_1
    if 0 < L18_1 then
      L18_1 = table_dedup
      L19_1 = L17_1
      L18_1 = L18_1(L19_1)
      L17_1 = L18_1
      L18_1 = #L17_1
      L18_1 = L18_1 * 10
      L15_1 = L15_1 + L18_1
      L18_1 = "["
      L19_1 = table
      L19_1 = L19_1.concat
      L20_1 = L17_1
      L21_1 = "|"
      L19_1 = L19_1(L20_1, L21_1)
      L20_1 = "]"
      L18_1 = L18_1 .. L19_1 .. L20_1
      L14_1.FileAttributes = L18_1
    end
  end
end
L17_1 = GetDirectoryRiskScore
L18_1 = L11_1
L17_1 = L17_1(L18_1)
L14_1.DirectoryGenScore = L17_1
L18_1 = NormalizeFileName
L19_1 = L12_1
L18_1 = L18_1(L19_1)
L20_1 = L12_1
L19_1 = L12_1.match
L21_1 = "^(.+)%.([^%.]+)$"
L19_1, L20_1 = L19_1(L20_1, L21_1)
L21_1 = GetFileExtensionScore
L22_1 = L20_1
L21_1 = L21_1(L22_1)
L14_1.FileExtensionScore = L21_1
L21_1 = L14_1.FileExtensionScore
if not L21_1 then
  L21_1 = 0
end
L15_1 = L15_1 + L21_1
L21_1 = string
L21_1 = L21_1.match
L22_1 = L11_1
L23_1 = "^(.*)\\"
L21_1 = L21_1(L22_1, L23_1)
L22_1 = NormalizeDirectory
L23_1 = L21_1
L22_1 = L22_1(L23_1)
L14_1.NormalizedDirectory = L22_1
L14_1.Directory = L21_1
L14_1.AnomalousDirectory = false
L23_1 = L13_1.AppName
if not L23_1 then
  L24_1 = mp
  L24_1 = L24_1.CLEAN
  return L24_1
end
L24_1 = "MarkerRecord_"
L25_1 = L23_1
L24_1 = L24_1 .. L25_1
L25_1 = IsPotentiallyClean
L26_1 = "CleanFileDrop"
L27_1 = L23_1
L28_1 = L12_1
L25_1 = L25_1(L26_1, L27_1, L28_1)
if L25_1 then
  L25_1 = mp
  L25_1 = L25_1.CLEAN
  return L25_1
end
if L22_1 then
  L25_1 = L23_1
  L26_1 = ";"
  L27_1 = L22_1
  L25_1 = L25_1 .. L26_1 .. L27_1
  L26_1 = AnomalyTableCheck
  L27_1 = "Appomaly_File_Directory"
  L28_1 = L25_1
  L29_1 = 30
  L30_1 = L24_1
  L26_1, L27_1, L28_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
  if L26_1 and not L27_1 then
    L14_1.AnomalousDirectory = true
    L17_1 = L17_1 + 5
  end
  L14_1.AnomalousDirectory_tblInfo = L28_1
end
L14_1.AnomalousFileExtension = false
L14_1.AnomalousFileName = false
if L12_1 then
  L14_1.FileName_Normalized = L18_1
  L14_1.FileName = L12_1
  L25_1 = GetFileNameRandomnessScore
  L26_1 = L12_1
  L25_1 = L25_1(L26_1)
  L14_1.FileName_Randomness_Score = L25_1
  L25_1 = pcall
  L26_1 = computeStringScores
  L27_1 = L12_1
  L25_1, L26_1, L27_1, L28_1, L29_1 = L25_1(L26_1, L27_1)
  L30_1 = {}
  L30_1.ConsonantVowelsRepetition = L26_1
  L30_1.ConsonantVowelsRepetitionRatio = L27_1
  L30_1.CaseSwitches = L28_1
  L30_1.LetterNumberAlternations = L29_1
  if L25_1 and (0 < L27_1 and 1 < L26_1 or 3 < L29_1 or 5 < L28_1) then
    L30_1.FileName_String_Score_Malicious = true
  end
  L14_1.FileName_String_Score = L30_1
  if L18_1 then
    L31_1 = L23_1
    L32_1 = ";"
    L33_1 = L18_1
    L31_1 = L31_1 .. L32_1 .. L33_1
    L32_1 = AnomalyTableCheck
    L33_1 = "Appomaly_File_Name"
    L34_1 = L31_1
    L35_1 = 30
    L36_1 = L24_1
    L32_1, L33_1, L34_1 = L32_1(L33_1, L34_1, L35_1, L36_1)
    if L32_1 and not L33_1 then
      L14_1.AnomalousFileName = true
      L15_1 = L15_1 + 10
    end
    L14_1.AnomalousFileName_tblInfo = L34_1
  end
  L32_1 = L12_1
  L31_1 = L12_1.match
  L33_1 = "^(.+)%.([^%.]+)$"
  L31_1, L32_1 = L31_1(L32_1, L33_1)
  if L32_1 then
    L33_1 = L23_1
    L34_1 = ";"
    L35_1 = L32_1
    L33_1 = L33_1 .. L34_1 .. L35_1
    L34_1 = AnomalyTableCheck
    L35_1 = "Appomaly_File_Extension"
    L36_1 = L33_1
    L37_1 = 30
    L38_1 = L24_1
    L34_1, L35_1, L36_1 = L34_1(L35_1, L36_1, L37_1, L38_1)
    if L34_1 and not L35_1 then
      L14_1.AnomalousFileExtension = true
      L15_1 = L15_1 + 10
    end
    L14_1.AnomalousFileExtension_tblInfo = L36_1
  end
end
L14_1.FileDropScore = L15_1
L25_1 = L13_1.Score
L26_1 = nil
L27_1 = nil
if 10 <= L15_1 then
  L28_1 = "SuspFileDrop["
  L30_1 = L2_1
  L29_1 = L2_1.match
  L31_1 = "pid:(%d+)"
  L29_1 = L29_1(L30_1, L31_1)
  L30_1 = "]["
  L31_1 = L22_1
  L32_1 = "]["
  L33_1 = L18_1
  L34_1 = "]"
  L26_1 = L28_1 .. L29_1 .. L30_1 .. L31_1 .. L32_1 .. L33_1 .. L34_1
  L27_1 = L15_1
  L28_1 = IncreaseProcessAnomalyScore
  L29_1 = L2_1
  L30_1 = L27_1
  L31_1 = L26_1
  L32_1 = L9_1
  L33_1 = L14_1
  L28_1(L29_1, L30_1, L31_1, L32_1, L33_1)
elseif 0 < L25_1 and 5 < L15_1 then
  L28_1 = "FileDrop["
  L30_1 = L2_1
  L29_1 = L2_1.match
  L31_1 = "pid:(%d+)"
  L29_1 = L29_1(L30_1, L31_1)
  L30_1 = "]["
  L31_1 = L22_1
  L32_1 = "]["
  L33_1 = L18_1
  L34_1 = "]"
  L26_1 = L28_1 .. L29_1 .. L30_1 .. L31_1 .. L32_1 .. L33_1 .. L34_1
  L27_1 = L15_1
  L28_1 = IncreaseProcessAnomalyScore
  L29_1 = L2_1
  L30_1 = L27_1
  L31_1 = L26_1
  L32_1 = L9_1
  L33_1 = L14_1
  L28_1(L29_1, L30_1, L31_1, L32_1, L33_1)
end
L28_1 = L14_1.AnomalousDirectory
if L28_1 then
  L28_1 = L23_1
  L29_1 = L22_1
  L30_1 = 1
  L31_1 = "FileDropInSuspDirectory"
  L32_1 = hasSeenBefore
  L33_1 = L28_1
  L34_1 = L29_1
  L35_1 = L30_1
  L36_1 = L31_1
  L32_1 = L32_1(L33_1, L34_1, L35_1, L36_1)
  if L32_1 then
    L32_1 = mp
    L32_1 = L32_1.CLEAN
    return L32_1
  end
  L32_1 = "SuspDirectoryDrop["
  L34_1 = L2_1
  L33_1 = L2_1.match
  L35_1 = "pid:(%d+)"
  L33_1 = L33_1(L34_1, L35_1)
  L34_1 = "]["
  L35_1 = L22_1
  L36_1 = "]"
  L26_1 = L32_1 .. L33_1 .. L34_1 .. L35_1 .. L36_1
  L27_1 = 5
  L32_1 = IncreaseProcessAnomalyScore
  L33_1 = L2_1
  L34_1 = L27_1
  L35_1 = L26_1
  L36_1 = L9_1
  L37_1 = L14_1
  L32_1(L33_1, L34_1, L35_1, L36_1, L37_1)
end
if L26_1 then
  L14_1.ProcessAttribute = L13_1
  L14_1.FilePath = L0_1
  L28_1 = add_parents_mp
  L28_1 = L28_1()
  L14_1.Parents = L28_1
  L28_1 = safeJsonSerialize
  L29_1 = L14_1
  L30_1 = 150
  L31_1 = nil
  L32_1 = true
  L28_1, L29_1 = L28_1(L29_1, L30_1, L31_1, L32_1)
  if L28_1 then
    L30_1 = MpCommon
    L30_1 = L30_1.BmTriggerSig
    L31_1 = L2_1
    L32_1 = "LUA:PFAppsSusShellDrop"
    L33_1 = L28_1
    L30_1(L31_1, L32_1, L33_1)
    L30_1 = mp
    L30_1 = L30_1.INFECTED
    return L30_1
  else
    L30_1 = set_research_data
    L31_1 = "Error"
    L32_1 = L29_1
    L33_1 = false
    L30_1(L31_1, L32_1, L33_1)
    L30_1 = mp
    L30_1 = L30_1.INFECTED
    return L30_1
  end
end
L28_1 = mp
L28_1 = L28_1.CLEAN
return L28_1
