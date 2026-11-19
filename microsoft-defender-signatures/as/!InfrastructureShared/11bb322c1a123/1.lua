-- Threat: !InfrastructureShared
-- Name: 11bb322c1a123
-- Type: 21
-- Includes: BMLuaLib, AppomalyHelpers, LuaFuncHelper

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

if bm.GetSignatureMatchDuration() > 100000000 then
  return mp.CLEAN
end
local r0_0 = bm.get_imagepath()
if r0_0 then
  local r0_1 = MpCommon.PathToWin32Path(r0_0)
  r0_0 = r0_1 or r0_0
  r0_1 = string
  r0_1 = r0_1.lower
  r0_1 = r0_1(r0_0)
  r0_0 = r0_1
  local r0_2 = r0_0
  r0_1 = r0_2.match
  r0_1 = r0_1(r0_2, "([^\\]+)$")
  local r0_3
  r0_2 = nil
  r0_3 = nil
  if this_sigattrlog[4].matched then
    local r0_4 = this_sigattrlog[4]
    local r0_5 = r0_4.utf8p2
    r0_4 = MpCommon.PathToWin32Path(r0_5)
    r0_5 = r0_4 or r0_5
    r0_4 = string
    r0_4 = r0_4.lower
    r0_4 = r0_4(r0_5)
    r0_5 = r0_4
    r0_4 = r0_5.match
    r0_4 = r0_4(r0_5, "([^\\]+)$")
    r0_2, r0_3 = r0_5, r0_4
  end
  if r0_2 and r0_3 then
    local r0_6 = string.find(r0_0, "\\windows\\system32\\", 1, true)
    if not r0_6 and not string.find(r0_0, "\\windows\\syswow64\\", 1, true) then
      local r0_7 = string.find(r0_2, "\\windows\\system32\\", 1, true)
      if not r0_7 and not string.find(r0_2, "\\windows\\syswow64\\", 1, true) then
        local r0_8 = r0_2:match("^(.*)\\")
        local r0_9 = r0_8:match("\\device\\vhdharddisk.-\\(.*)")
        r0_8 = r0_9 or r0_8
        r0_9 = r0_8
        local r0_10 = r0_3
        r0_9 = r0_9 .. "\\" .. r0_10
        local r0_11 = string.gsub
        r0_10 = r0_9
        r0_11 = r0_11(r0_10, "\\", "\\\\")
        r0_9 = r0_11
        r0_10 = r0_9
        r0_11 = r0_10:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
        r0_9 = r0_11
        r0_11 = pcall
        r0_10 = MpCommon
        local r0_12, r0_13 = r0_11(r0_10.RollingQueueQueryKeyRegex,
          "RQ_RecentExecDropped_MultipleKey_30m", r0_9)
        local r0_14 = {}
        local r0_15 = 0
        if r0_12 and r0_13 then
          local r0_16 = r0_13.value and { r0_13 } or r0_13
          local r0_17, r0_18, r0_19 = ipairs(r0_16)
          for r0_20, r0_21 in r0_17, r0_18, r0_19 do
            local r0_22 = string.find(r0_21.value, "UnsignedFile", 1, true)
            if r0_22 then
              r0_15 = r0_15 + 50
              r0_14.FileDroppedRecently = true
              r0_14.FileInfo = r0_16
              local r0_23 = string.match(r0_21.value, "Process_Img(.*)")
              if r0_23 then
                local r0_24 = contains(r0_23,
                  { "program files", "appdata", "dllhost.exe", "svchost.exe" })
                if r0_24 then
                  r0_15 = r0_15 - 40
                end
                r0_24 = contains
                r0_24 = r0_24(r0_23, { "explorer.exe", "WinRAR.exe", "7z.exe" })
                if r0_24 then
                  r0_15 = r0_15 + 50
                end
              end
              local r0_25 = string.find(r0_21.value, "FileAttributes", 1, true)
              if r0_25 then
                local r0_26 = string.match(r0_21.value, "%[(.*)%]")
                local r0_27, r0_28, r0_29 = string.gmatch(r0_26, "([^|]+)")
                for r0_30 in r0_27, r0_28, r0_29 do
                  local r0_31 = string.find(r0_30, "Aurora.A!rfn", 1, true)
                  if not r0_31 then
                    r0_15 = r0_15 + 1
                  end
                  if r0_30 == "SLF:HighRiskHasMotW" then
                    r0_15 = r0_15 + 100
                  end
                end
              end
              break
            end
          end
          if r0_14.FileDroppedRecently then
            local r0_32 = string.gsub(r0_2, "%d+", "0")
            local r0_33 = string.gsub(r0_3, "%d+", "0")
            local r0_34 = r0_1
            local r0_35, r0_36, r0_37 = r0_33, "|", r0_32
            r0_34 = r0_34 .. "|" .. r0_35 .. r0_36 .. r0_37
            local r0_38 = AnomalyTableCheck
            r0_35 = "Appomaly_LoadedDlls_Path_Normalized"
            r0_36 = r0_34
            r0_37 = 2
            local r0_39 = r0_1
            local r0_40 = "MarkerRecord_" .. r0_39
            r0_39 = nil
            local r0_41, r0_42, r0_43 = r0_38(r0_35, r0_36, r0_37, r0_40)
            if r0_41 then
              local r0_44 = MpCommon.GetOriginalFileName(r0_0)
              if not r0_44 then
                local r0_45 = sysio.GetPEVersionInfo(r0_0)
                if r0_45 and r0_45.OriginalFilename then
                  r0_44 = r0_45.OriginalFilename
                  MpCommon.SetOriginalFileName(r0_0, r0_44)
                end
              end
              if r0_44 then
                local r0_46 = r0_44
                local r0_47, r0_48, r0_49 = r0_33, "|", r0_32
                r0_34 = r0_46 .. "|" .. r0_47 .. r0_48 .. r0_49
                r0_46 = AnomalyTableCheck
                r0_47 = r0_34
                r0_48 = 2
                r0_49 = "MarkerRecord_"
                local r0_50 = r0_1
                local r0_51 = r0_49 .. r0_50
                r0_50 = nil
                local r0_52, r0_53, r0_54 = r0_46("Appomaly_LoadedDlls_Path_Normalized", r0_47,
                  r0_48, r0_51)
                r0_38, r0_35, r0_36 = r0_52, r0_53, r0_54
              else
                r0_38, r0_35, r0_36 = r0_41, r0_42, r0_43
              end
            else
              r0_38, r0_35, r0_36 = r0_41, r0_42, r0_43
            end
            bm.add_related_string("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(r0_36),
              bm.RelatedStringBMReport)
            r0_14.AppName = r0_1
            r0_14.Dll_Path = r0_2
            r0_14.Key = r0_34
            local r0_55 = sysio.GetFileSize
            r0_14.Dll_FileSize = r0_55(r0_2) or 0
            r0_55 = "Appomaly_LoadedDlls_Size"
            local r0_56, r0_57 = r0_1, r0_3
            r0_56 = r0_56 .. r0_57
            r0_57 = GetRollingQueueKeyValue
            r0_14.Dll_PrevFileSize = r0_57(r0_55, r0_56) or -1
            if (r0_14.Dll_PrevFileSize == -1 or r0_14.Dll_PrevFileSize == 0)
              and r0_14.Dll_FileSize > 0 then
              AppendToRollingQueue(r0_55, r0_56, r0_14.Dll_FileSize, 31536000, 1000)
            elseif r0_14.Dll_FileSize > 0 then
              local r0_58 = tonumber(r0_14.Dll_PrevFileSize)
              r0_14.Dll_PrevFileSize = r0_58
              r0_58 = r0_14.Dll_PrevFileSize
              r0_58 = r0_58 * 2
              if r0_58 < r0_14.Dll_FileSize or r0_14.Dll_FileSize < r0_14.Dll_PrevFileSize / 2 then
                r0_14.DllFileSizeAnomalous = true
                local r0_59 = r0_14.Dll_FileSize
                r0_14.FileSizeDiffRatio = r0_59 * 100 / r0_14.Dll_PrevFileSize
                if r0_14.FileSizeDiffRatio < 30 then
                  r0_15 = r0_15 + 10
                end
              end
            end
            if r0_14.Dll_PrevFileSize == -1 and not r0_35 then
              r0_14.DLLLoadAfterTraining = true
            end
            if not r0_38 and not r0_35 and not r0_14.DllFileSizeAnomalous then
              return mp.CLEAN
            end
            if r0_14.Dll_PrevFileSize == r0_14.Dll_FileSize then
              return mp.CLEAN
            end
            local r0_60 = "Appomaly_LoadedDlls_Version"
            local r0_61, r0_62 = r0_1, r0_3
            local r0_63 = r0_14.Dll_FileSize
            r0_61 = r0_61 .. r0_62 .. r0_63
            r0_62 = GetRollingQueueKeyValue
            r0_14.Dll_VersionInfo = r0_62(r0_60, r0_61) or ""
            if r0_14.Dll_VersionInfo == "" then
              local r0_64 = sysio.GetPEVersionInfo
              r0_64 = r0_64(r0_2) or {}
              local r0_65 = r0_64.OriginalFilename or ""
              local r0_66 = r0_64.CompanyName or ""
              local r0_67 = r0_64.FileDescription
              r0_65 = r0_65 .. "|" .. r0_66 .. "|" .. (r0_67 or "")
              r0_14.Dll_VersionInfo = r0_65
              AppendToRollingQueue(r0_60, r0_61, r0_65, 31536000, 1000)
            end
            local r0_68 = string.find(r0_14.Dll_VersionInfo, "Microsoft", 1, true)
            if r0_68 then
              return mp.CLEAN
            end

            local function r0_69(p1_0, p1_1)
              p1_0 = string.lower(p1_0)
              p1_1 = string.lower(p1_1)
              local r1_0, r1_1, r1_2 = string.match(p1_0, "(.-)|(.-)|(.*)")
              local r1_3, r1_4, r1_5 = string.match(p1_1, "(.-)|(.-)|(.*)")
              if r1_0 == r1_3 or r1_1 == r1_4 or r1_2 == r1_5 then
                return true
              end
              return false
            end

            local r0_70 = pcall
            local r0_71 = MpCommon.RollingQueueQueryKeyRegex
            local r0_72, r0_73 = r0_1, r0_3
            r0_72 = r0_72 .. r0_73
            r0_73 = nil
            local r0_74, r0_75 = r0_70(r0_71, r0_60, r0_72)
            local r0_76 = r0_75 or {}
            r0_14.Dll_PrevVersionInfo = r0_76
            r0_75 = r0_75.value and { r0_75 } or r0_75
            if r0_14.Dll_VersionInfo ~= "||"
              and r0_14.Dll_VersionInfo == r0_14.Dll_PrevVersionInfo.value then
              return mp.CLEAN
            end
            if r0_14.Dll_VersionInfo ~= "||" then
              for r0_77, r0_78 in ipairs(r0_75) do
                local r0_79 = r0_69
                r0_79 = r0_79(r0_78.value, r0_14.Dll_VersionInfo)
                if r0_79 then
                  return mp.CLEAN
                end
              end
            end
            if r0_14.Dll_PrevVersionInfo ~= "||" then
              r0_15 = r0_15 + 10
            end
            local r0_80 = r0_2:match("^(.*)\\")
            if r0_80 == r0_0:match("^(.*)\\") then
              r0_14.SameDirectory = true
              r0_15 = r0_15 + 50
            end
            local r0_81, r0_82 = IsKeyInRollingQueue("SYSTEM_DLLs", r0_3)
            if r0_82 then
              if r0_82 ~= "NONE" then
                r0_14.POTENTIAL_SIDE_LOADING = r0_82
                r0_15 = r0_15 + 50
              end
            else
              local r0_83 = "NONE"
              if sysio.IsFileExists("c:\\Windows\\System32\\" .. r0_3) then
                r0_83 = "System32"
                r0_14.POTENTIAL_SIDE_LOADING = "System32"
                r0_15 = r0_15 + 50
              else
                local r0_84 = sysio.IsFileExists
                local r0_85 = r0_3
                if r0_84("c:\\Windows\\SysWOW64\\" .. r0_85) then
                  r0_83 = "SysWOW64"
                  r0_14.POTENTIAL_SIDE_LOADING = "SysWOW64"
                  r0_15 = r0_15 + 50
                end
              end
              AppendToRollingQueue("SYSTEM_DLLs", r0_3, r0_83, 31104000, 1000)
            end
            if r0_35 then
              return mp.CLEAN
            end
            local r0_86 = MpCommon.StringRegExpSearch("\\\\(desktop|download|onedrive|document|picture)",
              r0_2)
            if r0_86 then
              r0_15 = r0_15 + 50
            end
            r0_86 = contains
            r0_86 = r0_86(r0_2, { "program files", "appdata" })
            if r0_86 then
              r0_15 = r0_15 - 40
            end
            r0_86 = IsDllInExpectedPath
            local r0_87, r0_88, r0_89 = r0_86(r0_3, r0_80, r0_1)
            if r0_87 and r0_88 then
              return mp.CLEAN
            end
            if r0_87 then
              r0_15 = r0_15 + 50
            end
            if r0_89 then
              r0_15 = r0_15 + 50
            end
            r0_14.Known_VulnerableDll = r0_87
            r0_14.Vulnerable_App = r0_89
            if not r0_14.Known_VulnerableDll and not r0_14.POTENTIAL_SIDE_LOADING then
              return mp.CLEAN
            end
            r0_14.Score = r0_15
            local r0_90, r0_91 = safeJsonSerialize(r0_14, 150, nil, true)
            if r0_15 >= 100 then
              bm.trigger_sig("PotentialSideLoading_D_Evaluator", r0_90)
            end
            bm.add_related_string("Additional_Info", r0_90 or r0_91 or "", bm.RelatedStringBMReport)
            bm.add_related_string("Score", r0_15, bm.RelatedStringBMReport)
            bm.add_related_file(r0_2)
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
