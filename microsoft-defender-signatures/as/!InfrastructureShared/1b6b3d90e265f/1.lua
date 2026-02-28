local L0_1, L1_1, L2_1, L3_1, L4_1, L5_1, L6_1, L7_1, L8_1, L9_1, L10_1, L11_1, L12_1, L13_1, L14_1, L15_1, L16_1, L17_1, L18_1, L19_1, L20_1, L21_1, L22_1, L23_1, L24_1, L25_1, L26_1, L27_1, L28_1, L29_1, L30_1, L31_1, L32_1, L33_1, L34_1, L35_1, L36_1, L37_1, L38_1, L39_1, L40_1, L41_1, L42_1, L43_1, L44_1
L0_1 = this_sigattrlog
L0_1 = L0_1[7]
L0_1 = L0_1.matched
if L0_1 then
  L0_1 = this_sigattrlog
  L0_1 = L0_1[7]
  L0_1 = L0_1.utf8p1
  if L0_1 then
    L0_1 = this_sigattrlog
    L0_1 = L0_1[7]
    L0_1 = L0_1.utf8p1
    L1_1 = MpCommon
    L1_1 = L1_1.PathToWin32Path
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1 or L0_1
    if not L1_1 then
    end
    if not L0_1 then
      L1_1 = mp
      L1_1 = L1_1.CLEAN
      return L1_1
    end
    L1_1 = string
    L1_1 = L1_1.lower
    L2_1 = L0_1
    L1_1 = L1_1(L2_1)
    L0_1 = L1_1
    L2_1 = L0_1
    L1_1 = L0_1.match
    L3_1 = "^(.*)\\"
    L1_1 = L1_1(L2_1, L3_1)
    L2_1 = bm
    L2_1 = L2_1.get_imagepath
    L2_1 = L2_1()
    if not L2_1 then
      L3_1 = mp
      L3_1 = L3_1.CLEAN
      return L3_1
    end
    L3_1 = MpCommon
    L3_1 = L3_1.PathToWin32Path
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1 or L2_1
    if not L3_1 then
    end
    L3_1 = string
    L3_1 = L3_1.lower
    L4_1 = L2_1
    L3_1 = L3_1(L4_1)
    L2_1 = L3_1
    L4_1 = L2_1
    L3_1 = L2_1.match
    L5_1 = "^(.*)\\"
    L3_1 = L3_1(L4_1, L5_1)
    if L3_1 ~= L1_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = mp
    L4_1 = L4_1.IsKnownFriendlyFile
    L5_1 = L0_1
    L6_1 = true
    L7_1 = false
    L4_1 = L4_1(L5_1, L6_1, L7_1)
    if L4_1 then
      L4_1 = mp
      L4_1 = L4_1.CLEAN
      return L4_1
    end
    L4_1 = {}
    L4_1.Dll_Path = L0_1
    L5_1 = 0
    L7_1 = L0_1
    L6_1 = L0_1.match
    L8_1 = "([^\\]+)$"
    L6_1 = L6_1(L7_1, L8_1)
    L8_1 = L2_1
    L7_1 = L2_1.match
    L9_1 = "([^\\]+)$"
    L7_1 = L7_1(L8_1, L9_1)
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L3_1
    L10_1 = "\\windows\\system32\\"
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if not L8_1 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L3_1
      L10_1 = "\\windows\\syswow64\\"
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        goto lbl_101
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    do return L8_1 end
    ::lbl_101::
    L8_1 = string
    L8_1 = L8_1.find
    L9_1 = L0_1
    L10_1 = "\\windows\\system32\\"
    L11_1 = 1
    L12_1 = true
    L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
    if not L8_1 then
      L8_1 = string
      L8_1 = L8_1.find
      L9_1 = L0_1
      L10_1 = "\\windows\\syswow64\\"
      L11_1 = 1
      L12_1 = true
      L8_1 = L8_1(L9_1, L10_1, L11_1, L12_1)
      if not L8_1 then
        goto lbl_122
      end
    end
    L8_1 = mp
    L8_1 = L8_1.CLEAN
    do return L8_1 end
    ::lbl_122::
    L8_1 = nil
    L10_1 = L1_1
    L9_1 = L1_1.match
    L11_1 = "\\device\\vhdharddisk.-\\(.*)"
    L9_1 = L9_1(L10_1, L11_1)
    L1_1 = L9_1 or L1_1
    if not L9_1 then
    end
    L9_1 = IsKeyValuePairInRollingQueue
    L10_1 = "ArchivesWithExec_FileName"
    L11_1 = L6_1
    L12_1 = L1_1
    L13_1 = false
    L9_1, L10_1 = L9_1(L10_1, L11_1, L12_1, L13_1)
    L11_1 = IsKeyValuePairInRollingQueue
    L12_1 = "ArchivesWithExec_FileName"
    L13_1 = L7_1
    L14_1 = L1_1
    L15_1 = false
    L11_1, L12_1 = L11_1(L12_1, L13_1, L14_1, L15_1)
    if L9_1 and L11_1 then
      L5_1 = L5_1 + 100
      L4_1.DllAndExecInArchive = true
      L4_1.Archive_Exe = L12_1
      L4_1.Archive_Dll = L10_1
      L8_1 = true
    end
    L13_1 = L1_1
    L14_1 = "\\"
    L15_1 = L6_1
    L13_1 = L13_1 .. L14_1 .. L15_1
    L14_1 = string
    L14_1 = L14_1.gsub
    L15_1 = L13_1
    L16_1 = "\\"
    L17_1 = "\\\\"
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    L13_1 = L14_1
    L15_1 = L13_1
    L14_1 = L13_1.gsub
    L16_1 = "([%^%$%(%)%.%[%]%*%+%-%?])"
    L17_1 = "\\%1"
    L14_1 = L14_1(L15_1, L16_1, L17_1)
    L13_1 = L14_1
    L14_1 = pcall
    L15_1 = MpCommon
    L15_1 = L15_1.RollingQueueQueryKeyRegex
    L16_1 = "RQ_RecentExecDropped_MultipleKey_30m"
    L17_1 = L13_1
    L14_1, L15_1 = L14_1(L15_1, L16_1, L17_1)
    if L14_1 and L15_1 then
      L16_1 = L15_1.value
      if L16_1 then
        L16_1 = {}
        L17_1 = L15_1
        L16_1[1] = L17_1
        L15_1 = L16_1
      end
      L16_1 = ipairs
      L17_1 = L15_1
      L16_1, L17_1, L18_1 = L16_1(L17_1)
      for L19_1, L20_1 in L16_1, L17_1, L18_1 do
        L21_1 = string
        L21_1 = L21_1.find
        L22_1 = L20_1.value
        L23_1 = "UnsignedFile"
        L24_1 = 1
        L25_1 = true
        L21_1 = L21_1(L22_1, L23_1, L24_1, L25_1)
        if L21_1 then
          L4_1.FileDroppedRecently = true
          L4_1.FileInfo = L15_1
          L5_1 = L5_1 + 50
          L8_1 = true
          L21_1 = string
          L21_1 = L21_1.match
          L22_1 = L20_1.value
          L23_1 = "Process_Img(.*)"
          L21_1 = L21_1(L22_1, L23_1)
          if L21_1 then
            L22_1 = contains
            L23_1 = L21_1
            L24_1 = {}
            L25_1 = "program files"
            L26_1 = "appdata"
            L27_1 = "dllhost.exe"
            L28_1 = "svchost.exe"
            L24_1[1] = L25_1
            L24_1[2] = L26_1
            L24_1[3] = L27_1
            L24_1[4] = L28_1
            L22_1 = L22_1(L23_1, L24_1)
            if L22_1 then
              L5_1 = L5_1 - 40
            end
            L22_1 = contains
            L23_1 = L21_1
            L24_1 = {}
            L25_1 = "explorer.exe"
            L26_1 = "WinRAR.exe"
            L27_1 = "7z.exe"
            L24_1[1] = L25_1
            L24_1[2] = L26_1
            L24_1[3] = L27_1
            L22_1 = L22_1(L23_1, L24_1)
            if L22_1 then
              L5_1 = L5_1 + 50
            end
          end
          L22_1 = string
          L22_1 = L22_1.find
          L23_1 = L20_1.value
          L24_1 = "FileAttributes"
          L25_1 = 1
          L26_1 = true
          L22_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
          if L22_1 then
            L22_1 = string
            L22_1 = L22_1.match
            L23_1 = L20_1.value
            L24_1 = "%[(.*)%]"
            L22_1 = L22_1(L23_1, L24_1)
            L23_1 = string
            L23_1 = L23_1.gmatch
            L24_1 = L22_1
            L25_1 = "([^|]+)"
            L23_1, L24_1, L25_1 = L23_1(L24_1, L25_1)
            for L26_1 in L23_1, L24_1, L25_1 do
              L27_1 = string
              L27_1 = L27_1.find
              L28_1 = L26_1
              L29_1 = "Aurora.A!rfn"
              L30_1 = 1
              L31_1 = true
              L27_1 = L27_1(L28_1, L29_1, L30_1, L31_1)
              if not L27_1 then
                L5_1 = L5_1 + 1
              end
              if L26_1 == "SLF:HighRiskHasMotW" then
                L5_1 = L5_1 + 100
              end
            end
          end
          break
        end
      end
      L16_1 = L4_1.FileDroppedRecently
      if not L16_1 then
        L16_1 = mp
        L16_1 = L16_1.CLEAN
        return L16_1
      end
    end
    if not L14_1 then
      L16_1 = bm
      L16_1 = L16_1.add_related_string
      L17_1 = "Error"
      L18_1 = L15_1
      L19_1 = bm
      L19_1 = L19_1.RelatedStringBMReport
      L16_1(L17_1, L18_1, L19_1)
    end
    L16_1 = L4_1.FileDroppedRecently
    if not L16_1 then
      L16_1 = pcall
      L17_1 = MpCommon
      L17_1 = L17_1.RollingQueueQueryKeyRegex
      L18_1 = "RQ_RecentExecDropped"
      L19_1 = L13_1
      L16_1, L17_1 = L16_1(L17_1, L18_1, L19_1)
      if L16_1 and L17_1 then
        L18_1 = ipairs
        L19_1 = L17_1
        L18_1, L19_1, L20_1 = L18_1(L19_1)
        for L21_1, L22_1 in L18_1, L19_1, L20_1 do
          L23_1 = string
          L23_1 = L23_1.find
          L24_1 = L22_1.value
          L25_1 = "UnsignedFile"
          L26_1 = 1
          L27_1 = true
          L23_1 = L23_1(L24_1, L25_1, L26_1, L27_1)
          if L23_1 then
            L23_1 = FiletimeToDaysElapsed
            L24_1 = L22_1.insert_time
            L23_1 = L23_1(L24_1)
            if L23_1 < 1 then
              L4_1.FileDroppedRecently_LongTermStrg = true
              L4_1.FileDropperInfo = L17_1
              L8_1 = true
              L5_1 = L5_1 + 50
              L23_1 = string
              L23_1 = L23_1.match
              L24_1 = L22_1.value
              L25_1 = "Process_Img(.*)"
              L23_1 = L23_1(L24_1, L25_1)
              if L23_1 then
                L24_1 = contains
                L25_1 = L23_1
                L26_1 = {}
                L27_1 = "program files"
                L28_1 = "appdata"
                L29_1 = "dllhost.exe"
                L30_1 = "svchost.exe"
                L26_1[1] = L27_1
                L26_1[2] = L28_1
                L26_1[3] = L29_1
                L26_1[4] = L30_1
                L24_1 = L24_1(L25_1, L26_1)
                if L24_1 then
                  L5_1 = L5_1 - 40
                end
                L24_1 = contains
                L25_1 = L23_1
                L26_1 = {}
                L27_1 = "explorer.exe"
                L28_1 = "WinRAR.exe"
                L29_1 = "7z.exe"
                L26_1[1] = L27_1
                L26_1[2] = L28_1
                L26_1[3] = L29_1
                L24_1 = L24_1(L25_1, L26_1)
                if L24_1 then
                  L5_1 = L5_1 + 50
                end
              end
              L24_1 = string
              L24_1 = L24_1.find
              L25_1 = L22_1.value
              L26_1 = "FileAttributes"
              L27_1 = 1
              L28_1 = true
              L24_1 = L24_1(L25_1, L26_1, L27_1, L28_1)
              if L24_1 then
                L24_1 = string
                L24_1 = L24_1.match
                L25_1 = L22_1.value
                L26_1 = "%[(.*)%]"
                L24_1 = L24_1(L25_1, L26_1)
                L25_1 = string
                L25_1 = L25_1.gmatch
                L26_1 = L24_1
                L27_1 = "([^|]+)"
                L25_1, L26_1, L27_1 = L25_1(L26_1, L27_1)
                for L28_1 in L25_1, L26_1, L27_1 do
                  L29_1 = string
                  L29_1 = L29_1.find
                  L30_1 = L28_1
                  L31_1 = "Aurora.A!rfn"
                  L32_1 = 1
                  L33_1 = true
                  L29_1 = L29_1(L30_1, L31_1, L32_1, L33_1)
                  if not L29_1 then
                    L5_1 = L5_1 + 1
                  end
                  if L28_1 == "SLF:HighRiskHasMotW" then
                    L5_1 = L5_1 + 100
                  end
                end
              end
              break
            end
          end
        end
        L18_1 = L4_1.FileDroppedRecently_LongTermStrg
        if not L18_1 then
          L18_1 = mp
          L18_1 = L18_1.CLEAN
          return L18_1
        end
      end
    end
    L16_1 = IsKeyInRollingQueue
    L17_1 = "SYSTEM_DLLs"
    L18_1 = L6_1
    L16_1, L17_1 = L16_1(L17_1, L18_1)
    if L17_1 then
      if L17_1 ~= "NONE" then
        L4_1.POTENTIAL_SIDE_LOADING = L17_1
        L5_1 = L5_1 + 50
      end
    else
      L18_1 = "NONE"
      L19_1 = sysio
      L19_1 = L19_1.IsFileExists
      L20_1 = "c:\\Windows\\System32\\"
      L21_1 = L6_1
      L20_1 = L20_1 .. L21_1
      L19_1 = L19_1(L20_1)
      if L19_1 then
        L18_1 = "System32"
        L4_1.POTENTIAL_SIDE_LOADING = "System32"
        L5_1 = L5_1 + 50
      else
        L19_1 = sysio
        L19_1 = L19_1.IsFileExists
        L20_1 = "c:\\Windows\\SysWOW64\\"
        L21_1 = L6_1
        L20_1 = L20_1 .. L21_1
        L19_1 = L19_1(L20_1)
        if L19_1 then
          L18_1 = "SysWOW64"
          L4_1.POTENTIAL_SIDE_LOADING = "SysWOW64"
          L5_1 = L5_1 + 50
        end
      end
      L19_1 = AppendToRollingQueue
      L20_1 = "SYSTEM_DLLs"
      L21_1 = L6_1
      L22_1 = L18_1
      L23_1 = 31104000
      L24_1 = 1000
      L19_1(L20_1, L21_1, L22_1, L23_1, L24_1)
    end
    if not L8_1 then
      L18_1 = mp
      L18_1 = L18_1.CLEAN
      return L18_1
    end
    L19_1 = L2_1
    L18_1 = L2_1.match
    L20_1 = "([^\\]+)$"
    L18_1 = L18_1(L19_1, L20_1)
    L19_1 = string
    L19_1 = L19_1.gsub
    L20_1 = L0_1
    L21_1 = "%d+"
    L22_1 = "0"
    L19_1 = L19_1(L20_1, L21_1, L22_1)
    L20_1 = string
    L20_1 = L20_1.gsub
    L21_1 = L6_1
    L22_1 = "%d+"
    L23_1 = "0"
    L20_1 = L20_1(L21_1, L22_1, L23_1)
    L21_1 = L18_1
    L22_1 = "|"
    L23_1 = L20_1
    L24_1 = "|"
    L25_1 = L19_1
    L21_1 = L21_1 .. L22_1 .. L23_1 .. L24_1 .. L25_1
    L22_1 = AnomalyTableCheck
    L23_1 = "Appomaly_LoadedDlls_Path_Normalized"
    L24_1 = L21_1
    L25_1 = 2
    L26_1 = "MarkerRecord_"
    L27_1 = L18_1
    L26_1 = L26_1 .. L27_1
    L22_1, L23_1, L24_1 = L22_1(L23_1, L24_1, L25_1, L26_1)
    if L22_1 then
      L25_1 = MpCommon
      L25_1 = L25_1.GetOriginalFileName
      L26_1 = L2_1
      L25_1 = L25_1(L26_1)
      if not L25_1 then
        L26_1 = sysio
        L26_1 = L26_1.GetPEVersionInfo
        L27_1 = L2_1
        L26_1 = L26_1(L27_1)
        if L26_1 then
          L27_1 = L26_1.OriginalFilename
          if L27_1 then
            L25_1 = L26_1.OriginalFilename
            L27_1 = MpCommon
            L27_1 = L27_1.SetOriginalFileName
            L28_1 = L2_1
            L29_1 = L25_1
            L27_1(L28_1, L29_1)
          end
        end
      end
      if L25_1 then
        L26_1 = L25_1
        L27_1 = "|"
        L28_1 = L20_1
        L29_1 = "|"
        L30_1 = L19_1
        L21_1 = L26_1 .. L27_1 .. L28_1 .. L29_1 .. L30_1
        L26_1 = AnomalyTableCheck
        L27_1 = "Appomaly_LoadedDlls_Path_Normalized"
        L28_1 = L21_1
        L29_1 = 2
        L30_1 = "MarkerRecord_"
        L31_1 = L18_1
        L30_1 = L30_1 .. L31_1
        L26_1, L27_1, L28_1 = L26_1(L27_1, L28_1, L29_1, L30_1)
        L24_1 = L28_1
        L23_1 = L27_1
        L22_1 = L26_1
      end
    end
    L4_1.AppName = L18_1
    L25_1 = sysio
    L25_1 = L25_1.GetFileSize
    L26_1 = L0_1
    L25_1 = L25_1(L26_1)
    if not L25_1 then
      L25_1 = 0
    end
    L4_1.Dll_FileSize = L25_1
    L4_1.Key = L21_1
    L25_1 = "Appomaly_LoadedDlls_Size"
    L26_1 = 31536000
    L27_1 = 1000
    L28_1 = L18_1
    L29_1 = L6_1
    L28_1 = L28_1 .. L29_1
    L29_1 = GetRollingQueueKeyValue
    L30_1 = L25_1
    L31_1 = L28_1
    L29_1 = L29_1(L30_1, L31_1)
    if not L29_1 then
      L29_1 = -1
    end
    L4_1.Dll_PrevFileSize = L29_1
    L29_1 = L4_1.Dll_PrevFileSize
    if L29_1 ~= -1 then
      L29_1 = L4_1.Dll_PrevFileSize
      if L29_1 ~= 0 then
        goto lbl_550
      end
    end
    L29_1 = L4_1.Dll_FileSize
    if 0 < L29_1 then
      L29_1 = AppendToRollingQueue
      L30_1 = L25_1
      L31_1 = L28_1
      L32_1 = L4_1.Dll_FileSize
      L33_1 = L26_1
      L34_1 = L27_1
      L29_1(L30_1, L31_1, L32_1, L33_1, L34_1)
    else
      ::lbl_550::
      L29_1 = tonumber
      L30_1 = L4_1.Dll_PrevFileSize
      L29_1 = L29_1(L30_1)
      L4_1.Dll_PrevFileSize = L29_1
      L29_1 = L4_1.Dll_PrevFileSize
      L29_1 = L29_1 * 2
      L30_1 = L4_1.Dll_FileSize
      if not (L29_1 < L30_1) then
        L29_1 = L4_1.Dll_FileSize
        L30_1 = L4_1.Dll_PrevFileSize
        L30_1 = L30_1 / 2
        if not (L29_1 < L30_1) then
          goto lbl_579
        end
      end
      L4_1.DllFileSizeAnomalous = true
      L29_1 = L4_1.Dll_FileSize
      L29_1 = L29_1 * 100
      L30_1 = L4_1.Dll_PrevFileSize
      L29_1 = L29_1 / L30_1
      L4_1.FileSizeDiffRatio = L29_1
      L29_1 = L4_1.Dll_FileSize
      L29_1 = L29_1 * 100
      L30_1 = L4_1.Dll_PrevFileSize
      L29_1 = L29_1 / L30_1
      L4_1.FileSizeDiffRatio = L29_1
      L29_1 = L4_1.FileSizeDiffRatio
      if L29_1 < 30 then
        L5_1 = L5_1 + 10
      end
    end
    ::lbl_579::
    L29_1 = L4_1.Dll_PrevFileSize
    if L29_1 == -1 and not L23_1 then
      L4_1.DLLLoadAfterTraining = true
    end
    L4_1.inTraining = L23_1
    if not L22_1 and not L23_1 then
      L29_1 = L4_1.DllFileSizeAnomalous
      if not L29_1 then
        L29_1 = mp
        L29_1 = L29_1.CLEAN
        return L29_1
      end
    end
    L29_1 = L4_1.Dll_PrevFileSize
    L30_1 = L4_1.Dll_FileSize
    if L29_1 == L30_1 then
      L29_1 = mp
      L29_1 = L29_1.CLEAN
      return L29_1
    end
    if L22_1 and not L23_1 then
      L4_1.Dll_PathNew = true
      L5_1 = L5_1 + 50
      L4_1.TableInfo = L24_1
    end
    L29_1 = "Appomaly_LoadedDlls_Version"
    L30_1 = 31536000
    L31_1 = 1000
    L32_1 = L18_1
    L33_1 = L6_1
    L34_1 = L4_1.Dll_FileSize
    L32_1 = L32_1 .. L33_1 .. L34_1
    L33_1 = GetRollingQueueKeyValue
    L34_1 = L29_1
    L35_1 = L32_1
    L33_1 = L33_1(L34_1, L35_1)
    if not L33_1 then
      L33_1 = ""
    end
    L4_1.Dll_VersionInfo = L33_1
    L33_1 = L4_1.Dll_VersionInfo
    if L33_1 == "" then
      L33_1 = sysio
      L33_1 = L33_1.GetPEVersionInfo
      L34_1 = L0_1
      L33_1 = L33_1(L34_1)
      if not L33_1 then
        L33_1 = {}
      end
      L34_1 = L33_1.OriginalFilename
      if not L34_1 then
        L34_1 = ""
      end
      L35_1 = "|"
      L36_1 = L33_1.CompanyName
      if not L36_1 then
        L36_1 = ""
      end
      L37_1 = "|"
      L38_1 = L33_1.FileDescription
      if not L38_1 then
        L38_1 = ""
      end
      L34_1 = L34_1 .. L35_1 .. L36_1 .. L37_1 .. L38_1
      L4_1.Dll_VersionInfo = L34_1
      L35_1 = AppendToRollingQueue
      L36_1 = L29_1
      L37_1 = L32_1
      L38_1 = L34_1
      L39_1 = L30_1
      L40_1 = L31_1
      L35_1(L36_1, L37_1, L38_1, L39_1, L40_1)
    end
    L33_1 = string
    L33_1 = L33_1.find
    L34_1 = L4_1.Dll_VersionInfo
    L35_1 = "Microsoft"
    L36_1 = 1
    L37_1 = true
    L33_1 = L33_1(L34_1, L35_1, L36_1, L37_1)
    if L33_1 then
      L33_1 = mp
      L33_1 = L33_1.CLEAN
      return L33_1
    end
    
    function L33_1(A0_2, A1_2)
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
    
    L34_1 = pcall
    L35_1 = MpCommon
    L35_1 = L35_1.RollingQueueQueryKeyRegex
    L36_1 = L29_1
    L37_1 = L18_1
    L38_1 = L6_1
    L37_1 = L37_1 .. L38_1
    L34_1, L35_1 = L34_1(L35_1, L36_1, L37_1)
    L36_1 = L35_1.value
    if L36_1 then
      L36_1 = {}
      L37_1 = L35_1
      L36_1[1] = L37_1
      L35_1 = L36_1
    end
    L36_1 = L35_1 or L36_1
    if not L35_1 then
      L36_1 = {}
    end
    L4_1.Dll_PrevVersionInfo = L36_1
    L36_1 = L4_1.Dll_VersionInfo
    if L36_1 ~= "||" then
      L36_1 = ipairs
      L37_1 = L35_1
      L36_1, L37_1, L38_1 = L36_1(L37_1)
      for L39_1, L40_1 in L36_1, L37_1, L38_1 do
        L41_1 = L33_1
        L42_1 = L40_1.value
        L43_1 = L4_1.Dll_VersionInfo
        L41_1 = L41_1(L42_1, L43_1)
        if L41_1 then
          L41_1 = mp
          L41_1 = L41_1.CLEAN
          return L41_1
        end
      end
    end
    L36_1 = L4_1.Dll_VersionInfo
    if L36_1 ~= "||" then
      L36_1 = L33_1
      L37_1 = L4_1.Dll_VersionInfo
      L38_1 = L4_1.Dll_PrevVersionInfo
      L38_1 = L38_1.value
      L36_1 = L36_1(L37_1, L38_1)
      if L36_1 then
        L36_1 = mp
        L36_1 = L36_1.CLEAN
        return L36_1
      end
    end
    L36_1 = L4_1.Dll_PrevVersionInfo
    if L36_1 ~= "||" then
      L5_1 = L5_1 + 10
    end
    L36_1 = IsDllInExpectedPath
    L37_1 = L6_1
    L38_1 = L1_1
    L39_1 = L7_1
    L36_1, L37_1, L38_1 = L36_1(L37_1, L38_1, L39_1)
    if L36_1 and L37_1 then
      L39_1 = mp
      L39_1 = L39_1.CLEAN
      return L39_1
    end
    if L36_1 then
      L5_1 = L5_1 + 50
    end
    if L38_1 then
      L5_1 = L5_1 + 50
    end
    L4_1.Known_VulnerableDll = L36_1
    L4_1.Vulnerable_App = L38_1
    L39_1 = L4_1.POTENTIAL_SIDE_LOADING
    if not L39_1 and not L36_1 then
      L39_1 = mp
      L39_1 = L39_1.CLEAN
      return L39_1
    end
    L39_1 = MpCommon
    L39_1 = L39_1.StringRegExpSearch
    L40_1 = "\\\\(desktop|download|onedrive|document|picture)"
    L41_1 = L0_1
    L39_1 = L39_1(L40_1, L41_1)
    if L39_1 then
      L5_1 = L5_1 + 50
    end
    L39_1 = contains
    L40_1 = L0_1
    L41_1 = {}
    L42_1 = "program files"
    L43_1 = "appdata"
    L41_1[1] = L42_1
    L41_1[2] = L43_1
    L39_1 = L39_1(L40_1, L41_1)
    if L39_1 then
      L5_1 = L5_1 - 40
    end
    L4_1.Score = L5_1
    L39_1 = safeJsonSerialize
    L40_1 = L4_1
    L41_1 = 100
    L42_1 = nil
    L43_1 = true
    L39_1, L40_1 = L39_1(L40_1, L41_1, L42_1, L43_1)
    L41_1 = L4_1.POTENTIAL_SIDE_LOADING
    if L41_1 then
      L41_1 = bm
      L41_1 = L41_1.trigger_sig
      L42_1 = "PotentialSideLoading_C_Evaluator"
      L43_1 = L39_1
      L41_1(L42_1, L43_1)
    end
    L41_1 = L4_1.POTENTIAL_SIDE_LOADING
    if L41_1 then
      L41_1 = L4_1.Known_VulnerableDll
      if L41_1 then
        goto lbl_795
      end
    end
    L41_1 = L4_1.DllAndExecInArchive
    ::lbl_795::
    if L41_1 then
      L41_1 = bm
      L41_1 = L41_1.trigger_sig
      L42_1 = "PotentialSideLoading_D2_Evaluator"
      L43_1 = L39_1
      L41_1(L42_1, L43_1)
    end
    L41_1 = L4_1.Known_VulnerableDll
    if L41_1 then
      L41_1 = L4_1.Vulnerable_App
    end
    if L41_1 or 150 <= L5_1 then
      L41_1 = bm
      L41_1 = L41_1.trigger_sig
      L42_1 = "PotentialSideLoading_D2_Evaluator"
      L43_1 = L39_1
      L41_1(L42_1, L43_1)
    end
    L41_1 = bm
    L41_1 = L41_1.add_related_string
    L42_1 = "Additional_Info"
    L43_1 = L39_1 or L43_1
    L43_1 = L40_1 or L43_1
    if not L39_1 and not L40_1 then
      L43_1 = ""
    end
    L44_1 = bm
    L44_1 = L44_1.RelatedStringBMReport
    L41_1(L42_1, L43_1, L44_1)
    L41_1 = bm
    L41_1 = L41_1.add_related_string
    L42_1 = "Score"
    L43_1 = L5_1
    L44_1 = bm
    L44_1 = L44_1.RelatedStringBMReport
    L41_1(L42_1, L43_1, L44_1)
    L41_1 = bm
    L41_1 = L41_1.add_related_string
    L42_1 = "Anomaly_LoadedDlls_TblInfo"
    L43_1 = safeJsonSerialize
    L44_1 = L24_1
    L43_1 = L43_1(L44_1)
    L44_1 = bm
    L44_1 = L44_1.RelatedStringBMReport
    L41_1(L42_1, L43_1, L44_1)
    L41_1 = bm
    L41_1 = L41_1.add_related_file
    L42_1 = L0_1
    L41_1(L42_1)
    L41_1 = mp
    L41_1 = L41_1.INFECTED
    return L41_1
  end
end
L0_1 = mp
L0_1 = L0_1.CLEAN
return L0_1
