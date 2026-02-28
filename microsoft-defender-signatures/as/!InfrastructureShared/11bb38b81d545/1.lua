local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1
L0_1 = bm
L0_1 = L0_1.GetSignatureMatchDuration
L0_1 = L0_1()
if 100000000 < L0_1 then
  L0_1 = mp
  L0_1 = L0_1.CLEAN
  return L0_1
end
L0_1 = bm
L0_1 = L0_1.get_imagepath
L0_1 = L0_1()
if not L0_1 then
  L1_1 = mp
  L1_1 = L1_1.CLEAN
  return L1_1
end
L1_1 = MpCommon
L1_1 = L1_1.PathToWin32Path
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1 or L0_1
if not L1_1 then
end
L1_1 = string
L1_1 = L1_1.lower
L2_1 = L0_1
L1_1 = L1_1(L2_1)
L0_1 = L1_1
L2_1 = L0_1
L1_1 = L0_1.match
L3_1 = "([^\\]+)$"
L1_1 = L1_1(L2_1, L3_1)
L2_1 = nil
L3_1 = nil
L4_1 = this_sigattrlog
L4_1 = L4_1[4]
L4_1 = L4_1.matched
if L4_1 then
  L4_1 = this_sigattrlog
  L4_1 = L4_1[4]
  L2_1 = L4_1.utf8p2
  L4_1 = MpCommon
  L4_1 = L4_1.PathToWin32Path
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1 or L2_1
  if not L4_1 then
  end
  L4_1 = string
  L4_1 = L4_1.lower
  L5_1 = L2_1
  L4_1 = L4_1(L5_1)
  L2_1 = L4_1
  L5_1 = L2_1
  L4_1 = L2_1.match
  L6_1 = "([^\\]+)$"
  L4_1 = L4_1(L5_1, L6_1)
  L3_1 = L4_1
end
if not L2_1 or not L3_1 then
  L4_1 = mp
  L4_1 = L4_1.CLEAN
  return L4_1
end
L4_1 = string
L4_1 = L4_1.find
L5_1 = L0_1
L6_1 = "\\windows\\system32\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L0_1
  L6_1 = "\\windows\\syswow64\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_83
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_83::
L4_1 = string
L4_1 = L4_1.find
L5_1 = L2_1
L6_1 = "\\windows\\system32\\"
L7_1 = 1
L8_1 = true
L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
if not L4_1 then
  L4_1 = string
  L4_1 = L4_1.find
  L5_1 = L2_1
  L6_1 = "\\windows\\syswow64\\"
  L7_1 = 1
  L8_1 = true
  L4_1 = L4_1(L5_1, L6_1, L7_1, L8_1)
  if not L4_1 then
    goto lbl_104
  end
end
L4_1 = mp
L4_1 = L4_1.CLEAN
do return L4_1 end
::lbl_104::
L5_1 = L2_1
L4_1 = L2_1.match
L6_1 = "^(.*)\\"
L4_1 = L4_1(L5_1, L6_1)
L6_1 = L4_1
L5_1 = L4_1.match
L7_1 = "\\device\\vhdharddisk.-\\(.*)"
L5_1 = L5_1(L6_1, L7_1)
L4_1 = L5_1 or L4_1
if not L5_1 then
end
L5_1 = L4_1
L6_1 = "\\"
L7_1 = L3_1
L5_1 = L5_1 .. L6_1 .. L7_1
L6_1 = string
L6_1 = L6_1.gsub
L7_1 = L5_1
L8_1 = "\\"
L9_1 = "\\\\"
L6_1 = L6_1(L7_1, L8_1, L9_1)
L5_1 = L6_1
L7_1 = L5_1
L6_1 = L5_1.gsub
L8_1 = "([%^%$%(%)%.%[%]%*%+%-%?])"
L9_1 = "\\%1"
L6_1 = L6_1(L7_1, L8_1, L9_1)
L5_1 = L6_1
L6_1 = pcall
L7_1 = MpCommon
L7_1 = L7_1.RollingQueueQueryKeyRegex
L8_1 = "RQ_RecentExecDropped_MultipleKey_30m"
L9_1 = L5_1
L6_1, L7_1 = L6_1(L7_1, L8_1, L9_1)
L8_1 = {}
L9_1 = 0
if L6_1 and L7_1 then
  L10_1 = L7_1.value
  if L10_1 then
    L10_1 = {}
    L11_1 = L7_1
    L10_1[1] = L11_1
    L7_1 = L10_1
  end
  L10_1 = ipairs
  L11_1 = L7_1
  L10_1, L11_1, L12_1 = L10_1(L11_1)
  for L13_1, L14_1 in L10_1, L11_1, L12_1 do
    L15_1 = string
    L15_1 = L15_1.find
    L16_1 = L14_1.value
    L17_1 = "UnsignedFile"
    L18_1 = 1
    L19_1 = true
    L15_1 = L15_1(L16_1, L17_1, L18_1, L19_1)
    if L15_1 then
      L9_1 = L9_1 + 50
      L8_1.FileDroppedRecently = true
      L8_1.FileInfo = L7_1
      L15_1 = string
      L15_1 = L15_1.match
      L16_1 = L14_1.value
      L17_1 = "Process_Img(.*)"
      L15_1 = L15_1(L16_1, L17_1)
      if L15_1 then
        L16_1 = contains
        L17_1 = L15_1
        L18_1 = {}
        L19_1 = "program files"
        L20_1 = "appdata"
        L21_1 = "dllhost.exe"
        L22_1 = "svchost.exe"
        L18_1[1] = L19_1
        L18_1[2] = L20_1
        L18_1[3] = L21_1
        L18_1[4] = L22_1
        L16_1 = L16_1(L17_1, L18_1)
        if L16_1 then
          L9_1 = L9_1 - 40
        end
        L16_1 = contains
        L17_1 = L15_1
        L18_1 = {}
        L19_1 = "explorer.exe"
        L20_1 = "WinRAR.exe"
        L21_1 = "7z.exe"
        L18_1[1] = L19_1
        L18_1[2] = L20_1
        L18_1[3] = L21_1
        L16_1 = L16_1(L17_1, L18_1)
        if L16_1 then
          L9_1 = L9_1 + 50
        end
      end
      L16_1 = string
      L16_1 = L16_1.find
      L17_1 = L14_1.value
      L18_1 = "FileAttributes"
      L19_1 = 1
      L20_1 = true
      L16_1 = L16_1(L17_1, L18_1, L19_1, L20_1)
      if L16_1 then
        L16_1 = string
        L16_1 = L16_1.match
        L17_1 = L14_1.value
        L18_1 = "%[(.*)%]"
        L16_1 = L16_1(L17_1, L18_1)
        L17_1 = string
        L17_1 = L17_1.gmatch
        L18_1 = L16_1
        L19_1 = "([^|]+)"
        L17_1, L18_1, L19_1 = L17_1(L18_1, L19_1)
        for L20_1 in L17_1, L18_1, L19_1 do
          L21_1 = string
          L21_1 = L21_1.find
          L22_1 = L20_1
          L23_1 = "Aurora.A!rfn"
          L24_1 = 1
          L25_1 = true
          L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
          if not L21_1 then
            L9_1 = L9_1 + 1
          end
          if L20_1 == "SLF:HighRiskHasMotW" then
            L9_1 = L9_1 + 100
          end
        end
      end
      break
    end
  end
  L10_1 = L8_1.FileDroppedRecently
  if not L10_1 then
    L10_1 = mp
    L10_1 = L10_1.CLEAN
    return L10_1
  end
else
  L10_1 = mp
  L10_1 = L10_1.CLEAN
  return L10_1
end
L10_1 = string
L10_1 = L10_1.gsub
L11_1 = L2_1
L12_1 = "%d+"
L13_1 = "0"
L10_1 = L10_1(L11_1, L12_1, L13_1)
L11_1 = string
L11_1 = L11_1.gsub
L12_1 = L3_1
L13_1 = "%d+"
L14_1 = "0"
L11_1 = L11_1(L12_1, L13_1, L14_1)
L12_1 = L1_1
L13_1 = "|"
L14_1 = L11_1
L15_1 = "|"
L16_1 = L10_1
L12_1 = L12_1 .. L13_1 .. L14_1 .. L15_1 .. L16_1
L13_1 = AnomalyTableCheck
L14_1 = "Appomaly_LoadedDlls_Path_Normalized"
L15_1 = L12_1
L16_1 = 2
L17_1 = "MarkerRecord_"
L18_1 = L1_1
L17_1 = L17_1 .. L18_1
L13_1, L14_1, L15_1 = L13_1(L14_1, L15_1, L16_1, L17_1)
if L13_1 then
  L16_1 = MpCommon
  L16_1 = L16_1.GetOriginalFileName
  L17_1 = L0_1
  L16_1 = L16_1(L17_1)
  if not L16_1 then
    L17_1 = sysio
    L17_1 = L17_1.GetPEVersionInfo
    L18_1 = L0_1
    L17_1 = L17_1(L18_1)
    if L17_1 then
      L18_1 = L17_1.OriginalFilename
      if L18_1 then
        L16_1 = L17_1.OriginalFilename
        L18_1 = MpCommon
        L18_1 = L18_1.SetOriginalFileName
        L19_1 = L0_1
        L20_1 = L16_1
        L18_1(L19_1, L20_1)
      end
    end
  end
  if L16_1 then
    L17_1 = L16_1
    L18_1 = "|"
    L19_1 = L11_1
    L20_1 = "|"
    L21_1 = L10_1
    L12_1 = L17_1 .. L18_1 .. L19_1 .. L20_1 .. L21_1
    L17_1 = AnomalyTableCheck
    L18_1 = "Appomaly_LoadedDlls_Path_Normalized"
    L19_1 = L12_1
    L20_1 = 2
    L21_1 = "MarkerRecord_"
    L22_1 = L1_1
    L21_1 = L21_1 .. L22_1
    L17_1, L18_1, L19_1 = L17_1(L18_1, L19_1, L20_1, L21_1)
    L15_1 = L19_1
    L14_1 = L18_1
    L13_1 = L17_1
  end
end
L16_1 = bm
L16_1 = L16_1.add_related_string
L17_1 = "Anomaly_LoadedDlls_TblInfo"
L18_1 = safeJsonSerialize
L19_1 = L15_1
L18_1 = L18_1(L19_1)
L19_1 = bm
L19_1 = L19_1.RelatedStringBMReport
L16_1(L17_1, L18_1, L19_1)
L8_1.AppName = L1_1
L8_1.Dll_Path = L2_1
L8_1.Key = L12_1
L16_1 = sysio
L16_1 = L16_1.GetFileSize
L17_1 = L2_1
L16_1 = L16_1(L17_1)
if not L16_1 then
  L16_1 = 0
end
L8_1.Dll_FileSize = L16_1
L16_1 = "Appomaly_LoadedDlls_Size"
L17_1 = 31536000
L18_1 = 1000
L19_1 = L1_1
L20_1 = L3_1
L19_1 = L19_1 .. L20_1
L20_1 = GetRollingQueueKeyValue
L21_1 = L16_1
L22_1 = L19_1
L20_1 = L20_1(L21_1, L22_1)
if not L20_1 then
  L20_1 = -1
end
L8_1.Dll_PrevFileSize = L20_1
L20_1 = L8_1.Dll_PrevFileSize
if L20_1 ~= -1 then
  L20_1 = L8_1.Dll_PrevFileSize
  if L20_1 ~= 0 then
    goto lbl_360
  end
end
L20_1 = L8_1.Dll_FileSize
if 0 < L20_1 then
  L20_1 = AppendToRollingQueue
  L21_1 = L16_1
  L22_1 = L19_1
  L23_1 = L8_1.Dll_FileSize
  L24_1 = L17_1
  L25_1 = L18_1
  L20_1(L21_1, L22_1, L23_1, L24_1, L25_1)
else
  ::lbl_360::
  L20_1 = L8_1.Dll_FileSize
  if 0 < L20_1 then
    L20_1 = tonumber
    L21_1 = L8_1.Dll_PrevFileSize
    L20_1 = L20_1(L21_1)
    L8_1.Dll_PrevFileSize = L20_1
    L20_1 = L8_1.Dll_PrevFileSize
    L20_1 = L20_1 * 2
    L21_1 = L8_1.Dll_FileSize
    if not (L20_1 < L21_1) then
      L20_1 = L8_1.Dll_FileSize
      L21_1 = L8_1.Dll_PrevFileSize
      L21_1 = L21_1 / 2
      if not (L20_1 < L21_1) then
        goto lbl_387
      end
    end
    L8_1.DllFileSizeAnomalous = true
    L20_1 = L8_1.Dll_FileSize
    L20_1 = L20_1 * 100
    L21_1 = L8_1.Dll_PrevFileSize
    L20_1 = L20_1 / L21_1
    L8_1.FileSizeDiffRatio = L20_1
    L20_1 = L8_1.FileSizeDiffRatio
    if L20_1 < 30 then
      L9_1 = L9_1 + 10
    end
  end
end
::lbl_387::
L20_1 = L8_1.Dll_PrevFileSize
if L20_1 == -1 and not L14_1 then
  L8_1.DLLLoadAfterTraining = true
end
if not L13_1 and not L14_1 then
  L20_1 = L8_1.DllFileSizeAnomalous
  if not L20_1 then
    L20_1 = mp
    L20_1 = L20_1.CLEAN
    return L20_1
  end
end
L20_1 = L8_1.Dll_PrevFileSize
L21_1 = L8_1.Dll_FileSize
if L20_1 == L21_1 then
  L20_1 = mp
  L20_1 = L20_1.CLEAN
  return L20_1
end
L20_1 = "Appomaly_LoadedDlls_Version"
L21_1 = 31536000
L22_1 = 1000
L23_1 = L1_1
L24_1 = L3_1
L25_1 = L8_1.Dll_FileSize
L23_1 = L23_1 .. L24_1 .. L25_1
L24_1 = GetRollingQueueKeyValue
L25_1 = L20_1
L26_1 = L23_1
L24_1 = L24_1(L25_1, L26_1)
if not L24_1 then
  L24_1 = ""
end
L8_1.Dll_VersionInfo = L24_1
L24_1 = L8_1.Dll_VersionInfo
if L24_1 == "" then
  L24_1 = sysio
  L24_1 = L24_1.GetPEVersionInfo
  L25_1 = L2_1
  L24_1 = L24_1(L25_1)
  if not L24_1 then
    L24_1 = {}
  end
  L25_1 = L24_1.OriginalFilename
  if not L25_1 then
    L25_1 = ""
  end
  L26_1 = "|"
  L27_1 = L24_1.CompanyName
  if not L27_1 then
    L27_1 = ""
  end
  L28_1 = "|"
  L29_1 = L24_1.FileDescription
  if not L29_1 then
    L29_1 = ""
  end
  L25_1 = L25_1 .. L26_1 .. L27_1 .. L28_1 .. L29_1
  L8_1.Dll_VersionInfo = L25_1
  L26_1 = AppendToRollingQueue
  L27_1 = L20_1
  L28_1 = L23_1
  L29_1 = L25_1
  L30_1 = L21_1
  L31_1 = L22_1
  L26_1(L27_1, L28_1, L29_1, L30_1, L31_1)
end
L24_1 = string
L24_1 = L24_1.find
L25_1 = L8_1.Dll_VersionInfo
L26_1 = "Microsoft"
L27_1 = 1
L28_1 = true
L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
if L24_1 then
  L24_1 = mp
  L24_1 = L24_1.CLEAN
  return L24_1
end

function L24_1(A0_2, A1_2)
  local L2_2, L3_2, L4_2, L5_2, L6_2, L7_2, L8_2
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A0_2
  L2_2 = L2_2(L3_2)
  A0_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.lower
  L3_2 = A1_2
  L2_2 = L2_2(L3_2)
  A1_2 = L2_2
  L2_2 = string
  L2_2 = L2_2.match
  L3_2 = A0_2
  L4_2 = "(.-)|(.-)|(.*)"
  L2_2, L3_2, L4_2 = L2_2(L3_2, L4_2)
  L5_2 = string
  L5_2 = L5_2.match
  L6_2 = A1_2
  L7_2 = "(.-)|(.-)|(.*)"
  L5_2, L6_2, L7_2 = L5_2(L6_2, L7_2)
  if L2_2 == L5_2 or L3_2 == L6_2 or L4_2 == L7_2 then
    L8_2 = true
    return L8_2
  end
  L8_2 = false
  return L8_2
end

L25_1 = pcall
L26_1 = MpCommon
L26_1 = L26_1.RollingQueueQueryKeyRegex
L27_1 = L20_1
L28_1 = L1_1
L29_1 = L3_1
L28_1 = L28_1 .. L29_1
L25_1, L26_1 = L25_1(L26_1, L27_1, L28_1)
L27_1 = L26_1 or L27_1
if not L26_1 then
  L27_1 = {}
end
L8_1.Dll_PrevVersionInfo = L27_1
L27_1 = L26_1.value
if L27_1 then
  L27_1 = {}
  L28_1 = L26_1
  L27_1[1] = L28_1
  L26_1 = L27_1
end
L27_1 = L8_1.Dll_VersionInfo
if L27_1 ~= "||" then
  L27_1 = L8_1.Dll_VersionInfo
  L28_1 = L8_1.Dll_PrevVersionInfo
  L28_1 = L28_1.value
  if L27_1 == L28_1 then
    L27_1 = mp
    L27_1 = L27_1.CLEAN
    return L27_1
  end
end
L27_1 = L8_1.Dll_VersionInfo
if L27_1 ~= "||" then
  L27_1 = ipairs
  L28_1 = L26_1
  L27_1, L28_1, L29_1 = L27_1(L28_1)
  for L30_1, L31_1 in L27_1, L28_1, L29_1 do
    L32_1 = L24_1
    L33_1 = L31_1.value
    L34_1 = L8_1.Dll_VersionInfo
    L32_1 = L32_1(L33_1, L34_1)
    if L32_1 then
      L32_1 = mp
      L32_1 = L32_1.CLEAN
      return L32_1
    end
  end
end
L27_1 = L8_1.Dll_PrevVersionInfo
if L27_1 ~= "||" then
  L9_1 = L9_1 + 10
end
L28_1 = L2_1
L27_1 = L2_1.match
L29_1 = "^(.*)\\"
L27_1 = L27_1(L28_1, L29_1)
L29_1 = L0_1
L28_1 = L0_1.match
L30_1 = "^(.*)\\"
L28_1 = L28_1(L29_1, L30_1)
if L27_1 == L28_1 then
  L8_1.SameDirectory = true
  L9_1 = L9_1 + 50
end
L29_1 = IsKeyInRollingQueue
L30_1 = "SYSTEM_DLLs"
L31_1 = L3_1
L29_1, L30_1 = L29_1(L30_1, L31_1)
if L30_1 then
  if L30_1 ~= "NONE" then
    L8_1.POTENTIAL_SIDE_LOADING = L30_1
    L9_1 = L9_1 + 50
  end
else
  L31_1 = "NONE"
  L32_1 = sysio
  L32_1 = L32_1.IsFileExists
  L33_1 = "c:\\Windows\\System32\\"
  L34_1 = L3_1
  L33_1 = L33_1 .. L34_1
  L32_1 = L32_1(L33_1)
  if L32_1 then
    L31_1 = "System32"
    L8_1.POTENTIAL_SIDE_LOADING = "System32"
    L9_1 = L9_1 + 50
  else
    L32_1 = sysio
    L32_1 = L32_1.IsFileExists
    L33_1 = "c:\\Windows\\SysWOW64\\"
    L34_1 = L3_1
    L33_1 = L33_1 .. L34_1
    L32_1 = L32_1(L33_1)
    if L32_1 then
      L31_1 = "SysWOW64"
      L8_1.POTENTIAL_SIDE_LOADING = "SysWOW64"
      L9_1 = L9_1 + 50
    end
  end
  L32_1 = AppendToRollingQueue
  L33_1 = "SYSTEM_DLLs"
  L34_1 = L3_1
  L35_1 = L31_1
  L36_1 = 31104000
  L37_1 = 1000
  L32_1(L33_1, L34_1, L35_1, L36_1, L37_1)
end
if not L14_1 then
  L31_1 = MpCommon
  L31_1 = L31_1.StringRegExpSearch
  L32_1 = "\\\\(desktop|download|onedrive|document|picture)"
  L33_1 = L2_1
  L31_1 = L31_1(L32_1, L33_1)
  if L31_1 then
    L9_1 = L9_1 + 50
  end
  L31_1 = contains
  L32_1 = L2_1
  L33_1 = {}
  L34_1 = "program files"
  L35_1 = "appdata"
  L33_1[1] = L34_1
  L33_1[2] = L35_1
  L31_1 = L31_1(L32_1, L33_1)
  if L31_1 then
    L9_1 = L9_1 - 40
  end
  L31_1 = IsDllInExpectedPath
  L32_1 = L3_1
  L33_1 = L27_1
  L34_1 = L1_1
  L31_1, L32_1, L33_1 = L31_1(L32_1, L33_1, L34_1)
  if L31_1 and L32_1 then
    L34_1 = mp
    L34_1 = L34_1.CLEAN
    return L34_1
  end
  if L31_1 then
    L9_1 = L9_1 + 50
  end
  if L33_1 then
    L9_1 = L9_1 + 50
  end
  L8_1.Known_VulnerableDll = L31_1
  L8_1.Vulnerable_App = L33_1
  L34_1 = L8_1.Known_VulnerableDll
  if not L34_1 then
    L34_1 = L8_1.POTENTIAL_SIDE_LOADING
    if not L34_1 then
      L34_1 = mp
      L34_1 = L34_1.CLEAN
      return L34_1
    end
  end
  L8_1.Score = L9_1
  L34_1 = safeJsonSerialize
  L35_1 = L8_1
  L36_1 = 150
  L37_1 = nil
  L38_1 = true
  L34_1, L35_1 = L34_1(L35_1, L36_1, L37_1, L38_1)
  if 100 <= L9_1 then
    L36_1 = bm
    L36_1 = L36_1.trigger_sig
    L37_1 = "PotentialSideLoading_D_Evaluator"
    L38_1 = L34_1
    L36_1(L37_1, L38_1)
  end
  L36_1 = bm
  L36_1 = L36_1.add_related_string
  L37_1 = "Additional_Info"
  L38_1 = L34_1 or L38_1
  L38_1 = L35_1 or L38_1
  if not L34_1 and not L35_1 then
    L38_1 = ""
  end
  L39_1 = bm
  L39_1 = L39_1.RelatedStringBMReport
  L36_1(L37_1, L38_1, L39_1)
  L36_1 = bm
  L36_1 = L36_1.add_related_string
  L37_1 = "Score"
  L38_1 = L9_1
  L39_1 = bm
  L39_1 = L39_1.RelatedStringBMReport
  L36_1(L37_1, L38_1, L39_1)
  L36_1 = bm
  L36_1 = L36_1.add_related_file
  L37_1 = L2_1
  L36_1(L37_1)
  L36_1 = mp
  L36_1 = L36_1.INFECTED
  return L36_1
end
L31_1 = mp
L31_1 = L31_1.CLEAN
return L31_1
