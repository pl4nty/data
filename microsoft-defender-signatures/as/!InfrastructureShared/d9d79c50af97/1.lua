local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1
L0_1 = {}
L1_1 = mp
L1_1 = L1_1.GetScannedPPID
L1_1 = L1_1()
if L1_1 == "" or L1_1 == nil then
  L2_1 = mp
  L2_1 = L2_1.CLEAN
  return L2_1
end
L2_1 = mp
L2_1 = L2_1.GetProcessCommandLine
L3_1 = L1_1
L2_1 = L2_1(L3_1)
L3_1 = MpCommon
L3_1 = L3_1.StringRegExpSearch
L4_1 = "(?i)regsvr32.*[-/]s\\s(.*)"
L5_1 = L2_1
L3_1, L4_1 = L3_1(L4_1, L5_1)
if not L4_1 then
  L5_1 = mp
  L5_1 = L5_1.CLEAN
  return L5_1
end
L5_1 = string
L5_1 = L5_1.gsub
L6_1 = L4_1
L7_1 = "'"
L8_1 = ""
L5_1 = L5_1(L6_1, L7_1, L8_1)
L4_1 = L5_1
L5_1 = string
L5_1 = L5_1.lower
L6_1 = L4_1
L5_1 = L5_1(L6_1)
L4_1 = L5_1
L0_1.Dll_Path = L4_1
L5_1 = string
L5_1 = L5_1.find
L6_1 = L4_1
L7_1 = "\\"
L8_1 = 1
L9_1 = true
L5_1 = L5_1(L6_1, L7_1, L8_1, L9_1)
if not L5_1 then
  L5_1 = "\\"
  L6_1 = L4_1
  L4_1 = L5_1 .. L6_1
end
L0_1.cmdLine = L2_1
L5_1 = 0
L6_1 = string
L6_1 = L6_1.gsub
L7_1 = L4_1
L8_1 = "\\"
L9_1 = "\\\\"
L6_1 = L6_1(L7_1, L8_1, L9_1)
L8_1 = L6_1
L7_1 = L6_1.gsub
L9_1 = "([%^%$%(%)%.%[%]%*%+%-%?])"
L10_1 = "\\%1"
L7_1 = L7_1(L8_1, L9_1, L10_1)
L6_1 = L7_1
L7_1 = pcall
L8_1 = MpCommon
L8_1 = L8_1.RollingQueueQueryKeyRegex
L9_1 = "RQ_RecentExecDropped_MultipleKey_30m"
L10_1 = L6_1
L7_1, L8_1 = L7_1(L8_1, L9_1, L10_1)
if L7_1 and L8_1 then
  L9_1 = L8_1.value
  if L9_1 then
    L9_1 = {}
    L10_1 = L8_1
    L9_1[1] = L10_1
    L8_1 = L9_1
  end
  L9_1 = ipairs
  L10_1 = L8_1
  L9_1, L10_1, L11_1 = L9_1(L10_1)
  for L12_1, L13_1 in L9_1, L10_1, L11_1 do
    L14_1 = string
    L14_1 = L14_1.find
    L15_1 = L13_1.value
    L16_1 = "UnsignedFile"
    L17_1 = 1
    L18_1 = true
    L14_1 = L14_1(L15_1, L16_1, L17_1, L18_1)
    if L14_1 then
      L0_1.FileDroppedRecently = true
      L0_1.FileInfo = L8_1
      L14_1 = string
      L14_1 = L14_1.match
      L15_1 = L13_1.value
      L16_1 = "Process_Img(.*)"
      L14_1 = L14_1(L15_1, L16_1)
      if L14_1 then
        L15_1 = contains
        L16_1 = L14_1
        L17_1 = {}
        L18_1 = "program files"
        L19_1 = "appdata"
        L20_1 = "dllhost.exe"
        L21_1 = "svchost.exe"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L17_1[4] = L21_1
        L15_1 = L15_1(L16_1, L17_1)
        if L15_1 then
          L5_1 = L5_1 - 40
        end
        L15_1 = contains
        L16_1 = L14_1
        L17_1 = {}
        L18_1 = "explorer.exe"
        L19_1 = "WinRAR.exe"
        L20_1 = "7z.exe"
        L21_1 = "curl.exe"
        L22_1 = "wget"
        L17_1[1] = L18_1
        L17_1[2] = L19_1
        L17_1[3] = L20_1
        L17_1[4] = L21_1
        L17_1[5] = L22_1
        L15_1 = L15_1(L16_1, L17_1)
        if L15_1 then
          L5_1 = L5_1 + 50
        end
      end
      L15_1 = string
      L15_1 = L15_1.find
      L16_1 = L13_1.value
      L17_1 = "FileAttributes"
      L18_1 = 1
      L19_1 = true
      L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
      if L15_1 then
        L15_1 = string
        L15_1 = L15_1.match
        L16_1 = L13_1.value
        L17_1 = "%[(.*)%]"
        L15_1 = L15_1(L16_1, L17_1)
        L16_1 = string
        L16_1 = L16_1.gmatch
        L17_1 = L15_1
        L18_1 = "([^|]+)"
        L16_1, L17_1, L18_1 = L16_1(L17_1, L18_1)
        for L19_1 in L16_1, L17_1, L18_1 do
          L20_1 = string
          L20_1 = L20_1.find
          L21_1 = L19_1
          L22_1 = "Aurora.A!rfn"
          L20_1 = L20_1(L21_1, L22_1)
          if not L20_1 then
            L5_1 = L5_1 + 10
          elseif L19_1 == "SLF:HighRiskHasMotW" then
            L5_1 = L5_1 + 100
          end
        end
      end
    end
  end
  L9_1 = L0_1.FileDroppedRecently
  if not L9_1 then
    L9_1 = mp
    L9_1 = L9_1.CLEAN
    return L9_1
  end
else
  L9_1 = mp
  L9_1 = L9_1.CLEAN
  return L9_1
end
L9_1 = MpCommon
L9_1 = L9_1.StringRegExpSearch
L10_1 = "\\\\(desktop|download|onedrive|document|picture)"
L11_1 = L4_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L5_1 = L5_1 + 50
end
L9_1 = contains
L10_1 = L4_1
L11_1 = {}
L12_1 = "program files"
L13_1 = "appdata"
L11_1[1] = L12_1
L11_1[2] = L13_1
L9_1 = L9_1(L10_1, L11_1)
if L9_1 then
  L5_1 = L5_1 - 40
end
L9_1 = mp
L9_1 = L9_1.GetParentProcInfo
L9_1 = L9_1()
if L9_1 then
  L10_1 = GetRollingQueueKeyValues
  L11_1 = "PFApp_PotentialDownload_Ppid"
  L12_1 = L9_1.ppid
  L10_1 = L10_1(L11_1, L12_1)
  if L10_1 then
    L0_1.ProcessWithPotentialDownload = true
    L0_1.DownloadCmds = L10_1
    L5_1 = L5_1 + 10
  end
  L11_1 = add_parents_mp
  L11_1 = L11_1()
  L0_1.Parents = L11_1
end
L10_1 = pcall
L11_1 = MpCommon
L11_1 = L11_1.RollingQueueQueryKeyRegex
L12_1 = "PFApp_FileDropped_Path"
L13_1 = L6_1
L10_1, L11_1 = L10_1(L11_1, L12_1, L13_1)
if L10_1 and L11_1 then
  L0_1.FileDroppedByATrackedProcess = true
  L12_1 = L11_1.value
  if L12_1 then
    L12_1 = {}
    L13_1 = L11_1
    L12_1[1] = L13_1
    L11_1 = L12_1
  end
  L12_1 = ipairs
  L13_1 = L11_1
  L12_1, L13_1, L14_1 = L12_1(L13_1)
  for L15_1, L16_1 in L12_1, L13_1, L14_1 do
    L17_1 = GetAppomalyProcessAttribute
    L18_1 = L16_1.value
    L17_1, L18_1 = L17_1(L18_1)
    if L18_1 then
      L19_1 = L16_1.key
      if L19_1 == L4_1 then
        L19_1 = "FilePathMatch"
        if L19_1 then
          goto lbl_243
        end
      end
      L19_1 = "FileNameMatch"
      ::lbl_243::
      L0_1.Confidence = L19_1
      L0_1.Process_Attribute = L18_1
      break
    end
  end
  L5_1 = L5_1 + 10
end
L0_1.Score = L5_1
if 10 <= L5_1 then
  L12_1 = safeJsonSerialize
  L13_1 = L0_1
  L14_1 = 150
  L15_1 = nil
  L16_1 = true
  L12_1, L13_1 = L12_1(L13_1, L14_1, L15_1, L16_1)
  L14_1 = MpCommon
  L14_1 = L14_1.BmTriggerSig
  L15_1 = L9_1.ppid
  L16_1 = "APML_SuspRegsvr_D"
  L17_1 = L12_1 or L17_1
  if not L12_1 then
    L17_1 = L13_1
  end
  L14_1(L15_1, L16_1, L17_1)
end
L12_1 = mp
L12_1 = L12_1.CLEAN
return L12_1
