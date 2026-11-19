-- Threat: !InfrastructureShared
-- Name: 1b6b3d90e265f
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper, AppomalyHelpers

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 then
  local r0_0 = this_sigattrlog[7].utf8p1
  r0_0 = MpCommon.PathToWin32Path(r0_0) or r0_0
  if r0_0 then
    local r0_1 = string.lower(r0_0)
    r0_0 = r0_1
    r0_1 = r0_0:match("^(.*)\\")
    local r0_2 = bm.get_imagepath()
    if r0_2 then
      local r0_3 = MpCommon.PathToWin32Path(r0_2)
      r0_2 = r0_3 or r0_2
      r0_3 = string
      r0_3 = r0_3.lower
      r0_3 = r0_3(r0_2)
      r0_2 = r0_3
      r0_3 = r0_2.match
      r0_3 = r0_3(r0_2, "^(.*)\\")
      if r0_3 == r0_1 then
        if mp.IsKnownFriendlyFile(r0_0, true, false) then
          return mp.CLEAN
        end
        local r0_4 = {}
        r0_4.Dll_Path = r0_0
        local r0_5 = 0
        local r0_6 = r0_0:match("([^\\]+)$")
        local r0_7 = r0_2:match("([^\\]+)$")
        local r0_8 = string.find(r0_3, "\\windows\\system32\\", 1, true)
        if not r0_8 and not string.find(r0_3, "\\windows\\syswow64\\", 1, true) then
          local r0_9 = string.find(r0_0, "\\windows\\system32\\", 1, true)
          if not r0_9 and not string.find(r0_0, "\\windows\\syswow64\\", 1, true) then
            local r0_10 = nil
            local r0_11 = r0_1:match("\\device\\vhdharddisk.-\\(.*)")
            r0_1 = r0_11 or r0_1
            r0_11 = IsKeyValuePairInRollingQueue
            local r0_12, r0_13 = r0_11("ArchivesWithExec_FileName", r0_6, r0_1, false)
            local r0_14, r0_15 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", r0_7,
              r0_1, false)
            if r0_12 and r0_14 then
              r0_5 = r0_5 + 100
              r0_4.DllAndExecInArchive = true
              r0_4.Archive_Exe = r0_15
              r0_4.Archive_Dll = r0_13
              r0_10 = true
            end
            local r0_16, r0_17 = r0_1, r0_6
            r0_16 = r0_16 .. "\\" .. r0_17
            local r0_18 = string.gsub
            r0_17 = r0_16
            r0_18 = r0_18(r0_17, "\\", "\\\\")
            r0_16 = r0_18
            r0_17 = r0_16
            r0_18 = r0_17:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
            r0_16 = r0_18
            r0_18 = pcall
            r0_17 = MpCommon
            local r0_19, r0_20 = r0_18(r0_17.RollingQueueQueryKeyRegex,
              "RQ_RecentExecDropped_MultipleKey_30m", r0_16)
            if r0_19 and r0_20 then
              r0_17 = r0_20.value and { r0_20 } or r0_20
              for r0_21, r0_22 in ipairs(r0_17) do
                local r0_23 = string.find(r0_22.value, "UnsignedFile", 1, true)
                if r0_23 then
                  r0_4.FileDroppedRecently = true
                  r0_4.FileInfo = r0_17
                  r0_5 = r0_5 + 50
                  r0_10 = true
                  local r0_24 = string.match(r0_22.value, "Process_Img(.*)")
                  if r0_24 then
                    local r0_25 = contains(r0_24,
                      { "program files", "appdata", "dllhost.exe", "svchost.exe" })
                    if r0_25 then
                      r0_5 = r0_5 - 40
                    end
                    r0_25 = contains
                    r0_25 = r0_25(r0_24, { "explorer.exe", "WinRAR.exe", "7z.exe" })
                    if r0_25 then
                      r0_5 = r0_5 + 50
                    end
                  end
                  local r0_26 = string.find(r0_22.value, "FileAttributes", 1, true)
                  if r0_26 then
                    local r0_27 = string.match(r0_22.value, "%[(.*)%]")
                    local r0_28, r0_29, r0_30 = string.gmatch(r0_27, "([^|]+)")
                    for r0_31 in r0_28, r0_29, r0_30 do
                      local r0_32 = string.find(r0_31, "Aurora.A!rfn", 1, true)
                      if not r0_32 then
                        r0_5 = r0_5 + 1
                      end
                      if r0_31 == "SLF:HighRiskHasMotW" then
                        r0_5 = r0_5 + 100
                      end
                    end
                  end
                  break
                end
              end
              if not r0_4.FileDroppedRecently then
                return mp.CLEAN
              end
            else
              r0_17 = r0_20
            end
            if not r0_19 then
              bm.add_related_string("Error", r0_17, bm.RelatedStringBMReport)
            end
            if not r0_4.FileDroppedRecently then
              local r0_33, r0_34 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped",
                r0_16)
              if r0_33 and r0_34 then
                local r0_35, r0_36, r0_37 = ipairs(r0_34)
                for r0_38, r0_39 in r0_35, r0_36, r0_37 do
                  local r0_40 = string.find(r0_39.value, "UnsignedFile", 1, true)
                  if r0_40 and FiletimeToDaysElapsed(r0_39.insert_time) < 1 then
                    r0_4.FileDroppedRecently_LongTermStrg = true
                    r0_4.FileDropperInfo = r0_34
                    r0_10 = true
                    r0_5 = r0_5 + 50
                    local r0_41 = string.match(r0_39.value, "Process_Img(.*)")
                    if r0_41 then
                      local r0_42 = contains(r0_41,
                        { "program files", "appdata", "dllhost.exe", "svchost.exe" })
                      if r0_42 then
                        r0_5 = r0_5 - 40
                      end
                      r0_42 = contains
                      r0_42 = r0_42(r0_41, { "explorer.exe", "WinRAR.exe", "7z.exe" })
                      if r0_42 then
                        r0_5 = r0_5 + 50
                      end
                    end
                    local r0_43 = string.find(r0_39.value, "FileAttributes", 1, true)
                    if r0_43 then
                      local r0_44 = string.match(r0_39.value, "%[(.*)%]")
                      local r0_45, r0_46, r0_47 = string.gmatch(r0_44, "([^|]+)")
                      for r0_48 in r0_45, r0_46, r0_47 do
                        local r0_49 = string.find(r0_48, "Aurora.A!rfn", 1, true)
                        if not r0_49 then
                          r0_5 = r0_5 + 1
                        end
                        if r0_48 == "SLF:HighRiskHasMotW" then
                          r0_5 = r0_5 + 100
                        end
                      end
                    end
                    break
                  end
                end
                if not r0_4.FileDroppedRecently_LongTermStrg then
                  return mp.CLEAN
                end
              end
            end
            local r0_50, r0_51 = IsKeyInRollingQueue("SYSTEM_DLLs", r0_6)
            if r0_51 then
              if r0_51 ~= "NONE" then
                r0_4.POTENTIAL_SIDE_LOADING = r0_51
                r0_5 = r0_5 + 50
              end
            else
              local r0_52 = "NONE"
              if sysio.IsFileExists("c:\\Windows\\System32\\" .. r0_6) then
                r0_52 = "System32"
                r0_4.POTENTIAL_SIDE_LOADING = "System32"
                r0_5 = r0_5 + 50
              else
                local r0_53 = sysio.IsFileExists
                local r0_54 = r0_6
                if r0_53("c:\\Windows\\SysWOW64\\" .. r0_54) then
                  r0_52 = "SysWOW64"
                  r0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
                  r0_5 = r0_5 + 50
                end
              end
              AppendToRollingQueue("SYSTEM_DLLs", r0_6, r0_52, 31104000, 1000)
            end
            if r0_10 then
              local r0_55 = r0_2:match("([^\\]+)$")
              local r0_56 = string.gsub(r0_0, "%d+", "0")
              local r0_57 = string.gsub(r0_6, "%d+", "0")
              local r0_58 = r0_55
              local r0_59, r0_60, r0_61 = r0_57, "|", r0_56
              r0_58 = r0_58 .. "|" .. r0_59 .. r0_60 .. r0_61
              local r0_62 = AnomalyTableCheck
              r0_59 = "Appomaly_LoadedDlls_Path_Normalized"
              r0_60 = r0_58
              r0_61 = 2
              local r0_63 = r0_55
              local r0_64 = "MarkerRecord_" .. r0_63
              r0_63 = nil
              r0_63 = nil
              local r0_65, r0_66, r0_67 = r0_62(r0_59, r0_60, r0_61, r0_64)
              if r0_65 then
                local r0_68 = MpCommon.GetOriginalFileName(r0_2)
                if not r0_68 then
                  local r0_69 = sysio.GetPEVersionInfo(r0_2)
                  if r0_69 and r0_69.OriginalFilename then
                    r0_68 = r0_69.OriginalFilename
                    MpCommon.SetOriginalFileName(r0_2, r0_68)
                  end
                end
                if r0_68 then
                  local r0_70 = r0_68
                  local r0_71, r0_72, r0_73 = r0_57, "|", r0_56
                  r0_58 = r0_70 .. "|" .. r0_71 .. r0_72 .. r0_73
                  r0_70 = AnomalyTableCheck
                  r0_71 = r0_58
                  r0_72 = 2
                  r0_73 = "MarkerRecord_"
                  local r0_74 = r0_55
                  local r0_75 = r0_73 .. r0_74
                  r0_74 = nil
                  local r0_76, r0_77, r0_78 = r0_70("Appomaly_LoadedDlls_Path_Normalized", r0_71,
                    r0_72, r0_75)
                  r0_62, r0_59, r0_60 = r0_76, r0_77, r0_78
                else
                  r0_62, r0_59, r0_60 = r0_65, r0_66, r0_67
                end
              else
                r0_62, r0_59, r0_60 = r0_65, r0_66, r0_67
              end
              r0_4.AppName = r0_55
              local r0_79 = sysio.GetFileSize
              r0_4.Dll_FileSize = r0_79(r0_0) or 0
              r0_4.Key = r0_58
              r0_79 = "Appomaly_LoadedDlls_Size"
              local r0_80, r0_81 = r0_55, r0_6
              r0_80 = r0_80 .. r0_81
              r0_81 = GetRollingQueueKeyValue
              r0_4.Dll_PrevFileSize = r0_81(r0_79, r0_80) or -1
              if (r0_4.Dll_PrevFileSize == -1 or r0_4.Dll_PrevFileSize == 0)
                and r0_4.Dll_FileSize > 0 then
                AppendToRollingQueue(r0_79, r0_80, r0_4.Dll_FileSize, 31536000, 1000)
              else
                local r0_82 = tonumber(r0_4.Dll_PrevFileSize)
                r0_4.Dll_PrevFileSize = r0_82
                r0_82 = r0_4.Dll_PrevFileSize
                r0_82 = r0_82 * 2
                if r0_82 < r0_4.Dll_FileSize or r0_4.Dll_FileSize < r0_4.Dll_PrevFileSize / 2 then
                  r0_4.DllFileSizeAnomalous = true
                  local r0_83 = r0_4.Dll_FileSize
                  r0_4.FileSizeDiffRatio = r0_83 * 100 / r0_4.Dll_PrevFileSize
                  r0_83 = r0_4.Dll_FileSize
                  r0_4.FileSizeDiffRatio = r0_83 * 100 / r0_4.Dll_PrevFileSize
                  r0_83 = r0_4.FileSizeDiffRatio
                  if r0_83 < 30 then
                    r0_5 = r0_5 + 10
                  end
                end
              end
              if r0_4.Dll_PrevFileSize == -1 and not r0_59 then
                r0_4.DLLLoadAfterTraining = true
              end
              r0_4.inTraining = r0_59
              if not r0_62 and not r0_59 and not r0_4.DllFileSizeAnomalous then
                return mp.CLEAN
              end
              if r0_4.Dll_PrevFileSize == r0_4.Dll_FileSize then
                return mp.CLEAN
              end
              if r0_62 and not r0_59 then
                r0_4.Dll_PathNew = true
                r0_5 = r0_5 + 50
                r0_4.TableInfo = r0_60
              end
              local r0_84 = "Appomaly_LoadedDlls_Version"
              local r0_85, r0_86 = r0_55, r0_6
              local r0_87 = r0_4.Dll_FileSize
              r0_85 = r0_85 .. r0_86 .. r0_87
              r0_86 = GetRollingQueueKeyValue
              r0_4.Dll_VersionInfo = r0_86(r0_84, r0_85) or ""
              if r0_4.Dll_VersionInfo == "" then
                local r0_88 = sysio.GetPEVersionInfo
                r0_88 = r0_88(r0_0) or {}
                local r0_89 = r0_88.OriginalFilename or ""
                local r0_90 = r0_88.CompanyName or ""
                local r0_91 = r0_88.FileDescription
                r0_89 = r0_89 .. "|" .. r0_90 .. "|" .. (r0_91 or "")
                r0_4.Dll_VersionInfo = r0_89
                AppendToRollingQueue(r0_84, r0_85, r0_89, 31536000, 1000)
              end
              local r0_92 = string.find(r0_4.Dll_VersionInfo, "Microsoft", 1, true)
              if r0_92 then
                return mp.CLEAN
              end

              local function r0_93(p1_0, p1_1)
                p1_0 = string.lower(p1_0)
                p1_1 = string.lower(p1_1)
                local r1_0, r1_1, r1_2 = string.match(p1_0, "(.-)|(.-)|(.*)")
                local r1_3, r1_4, r1_5 = string.match(p1_1, "(.-)|(.-)|(.*)")
                if r1_0 == r1_3 or r1_1 == r1_4 or r1_2 == r1_5 then
                  return true
                end
                return false
              end

              local r0_94 = pcall
              local r0_95 = MpCommon.RollingQueueQueryKeyRegex
              local r0_96, r0_97 = r0_55, r0_6
              r0_96 = r0_96 .. r0_97
              r0_97 = nil
              local r0_98, r0_99 = r0_94(r0_95, r0_84, r0_96)
              r0_99 = r0_99.value and { r0_99 } or r0_99
              local r0_100 = r0_99 or {}
              r0_4.Dll_PrevVersionInfo = r0_100
              if r0_4.Dll_VersionInfo ~= "||" then
                local r0_101, r0_102, r0_103 = ipairs(r0_99)
                for r0_104, r0_105 in r0_101, r0_102, r0_103 do
                  local r0_106 = r0_93
                  r0_106 = r0_106(r0_105.value, r0_4.Dll_VersionInfo)
                  if r0_106 then
                    return mp.CLEAN
                  end
                end
              end
              if r0_4.Dll_VersionInfo ~= "||"
                and r0_93(r0_4.Dll_VersionInfo, r0_4.Dll_PrevVersionInfo.value) then
                return mp.CLEAN
              end
              if r0_4.Dll_PrevVersionInfo ~= "||" then
                r0_5 = r0_5 + 10
              end
              local r0_107, r0_108, r0_109 = IsDllInExpectedPath(r0_6, r0_1, r0_7)
              if r0_107 and r0_108 then
                return mp.CLEAN
              end
              if r0_107 then
                r0_5 = r0_5 + 50
              end
              if r0_109 then
                r0_5 = r0_5 + 50
              end
              r0_4.Known_VulnerableDll = r0_107
              r0_4.Vulnerable_App = r0_109
              if not r0_4.POTENTIAL_SIDE_LOADING and not r0_107 then
                return mp.CLEAN
              end
              local r0_110 = MpCommon.StringRegExpSearch("\\\\(desktop|download|onedrive|document|picture)",
                r0_0)
              if r0_110 then
                r0_5 = r0_5 + 50
              end
              r0_110 = contains
              r0_110 = r0_110(r0_0, { "program files", "appdata" })
              if r0_110 then
                r0_5 = r0_5 - 40
              end
              r0_4.Score = r0_5
              r0_110 = safeJsonSerialize
              local r0_111, r0_112 = r0_110(r0_4, 100, nil, true)
              if r0_4.POTENTIAL_SIDE_LOADING then
                bm.trigger_sig("PotentialSideLoading_C_Evaluator", r0_111)
              end
              if r0_4.POTENTIAL_SIDE_LOADING and r0_4.Known_VulnerableDll
                or r0_4.DllAndExecInArchive then
                bm.trigger_sig("PotentialSideLoading_D2_Evaluator", r0_111)
              end
              if r0_4.Known_VulnerableDll and r0_4.Vulnerable_App or r0_5 >= 150 then
                bm.trigger_sig("PotentialSideLoading_D2_Evaluator", r0_111)
              end
              bm.add_related_string("Additional_Info", r0_111 or r0_112 or "",
                bm.RelatedStringBMReport)
              bm.add_related_string("Score", r0_5, bm.RelatedStringBMReport)
              bm.add_related_string("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(r0_60),
                bm.RelatedStringBMReport)
              bm.add_related_file(r0_0)
              return mp.INFECTED
            end
            return mp.CLEAN
          end
          return mp.CLEAN
        end
        return mp.CLEAN
      end
      return mp.CLEAN
    end
    return mp.CLEAN
  end
  return mp.CLEAN
end
return mp.CLEAN
