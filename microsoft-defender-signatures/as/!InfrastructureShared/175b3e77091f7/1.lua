-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\175b3e77091f7\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[6]).matched and (this_sigattrlog[6]).utf8p1 then
  local l_0_0 = (this_sigattrlog[6]).utf8p1
  if (MpCommon.PathToWin32Path)(l_0_0) or not l_0_0 then
    return mp.CLEAN
  end
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = l_0_0:match("^(.*)\\")
  local l_0_2 = (bm.get_imagepath)()
  if not l_0_2 then
    return mp.CLEAN
  end
  if not (MpCommon.PathToWin32Path)(l_0_2) then
    l_0_2 = (string.lower)(l_0_2)
    local l_0_3 = l_0_2:match("^(.*)\\")
    if l_0_3 ~= l_0_1 then
      return mp.CLEAN
    end
    if (mp.IsKnownFriendlyFile)(l_0_0, true, false) then
      return mp.CLEAN
    end
    local l_0_4 = {}
    l_0_4.Dll_Path = l_0_0
    local l_0_5 = 0
    local l_0_6 = l_0_0:match("([^\\]+)$")
    local l_0_7 = l_0_2:match("([^\\]+)$")
    if (string.find)(l_0_3, "\\windows\\system32\\", 1, true) or (string.find)(l_0_3, "\\windows\\syswow64\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_8 = nil
    if not l_0_1:match("\\device\\vhdharddisk.-\\(.*)") then
      local l_0_9, l_0_10 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", l_0_6, l_0_1, false)
      local l_0_11, l_0_12 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", l_0_7, l_0_1, false)
      if l_0_9 and l_0_11 then
        l_0_5 = l_0_5 + 100
        l_0_4.DllAndExecInArchive = true
        l_0_4.Archive_Exe = l_0_12
        l_0_4.Archive_Dll = l_0_10
        l_0_8 = true
      end
      local l_0_13 = l_0_1 .. "\\" .. l_0_6
      l_0_13 = (string.gsub)(l_0_13, "\\", "\\\\")
      l_0_13 = l_0_13:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
      local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_13)
      if l_0_14 and l_0_15 then
        for l_0_19,l_0_20 in ipairs(l_0_15) do
          if (string.find)(l_0_20.value, "FileAttributes", 1, true) or (string.find)(l_0_20.value, "UnsignedFile", 1, true) then
            l_0_4.FileDroppedRecently = true
            l_0_4.FileInfo = l_0_15
            l_0_5 = l_0_5 + 50
            l_0_8 = true
          end
          do break end
        end
        do
          if not l_0_4.FileDroppedRecently then
            return mp.CLEAN
          end
          if not l_0_14 then
            (bm.add_related_string)("Error", l_0_15, bm.RelatedStringBMReport)
          end
          local l_0_21, l_0_22 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_13)
          if l_0_21 and l_0_22 then
            for l_0_26,l_0_27 in ipairs(l_0_22) do
              if (string.find)(l_0_27.value, "UnsignedFile", 1, true) and FiletimeToDaysElapsed(l_0_27.insert_time) < 1 then
                l_0_4.FileDroppedRecently_LongTermStrg = true
                l_0_4.FileDropperInfo = l_0_22
                l_0_8 = true
                l_0_5 = l_0_5 + 50
                if (string.find)(l_0_27.value, "FileAttributes", 1, true) then
                  local l_0_28 = (string.match)(l_0_27.value, "%[(.*)%]")
                  for l_0_32 in (string.gmatch)(l_0_28, "([^|]+)") do
                    if l_0_32 ~= "SLF:Aurora.A!rfn" then
                      l_0_5 = l_0_5 + 1
                    end
                  end
                end
                break
              end
            end
            do
              if not l_0_4.FileDroppedRecently_LongTermStrg then
                return mp.CLEAN
              end
              local l_0_33, l_0_34 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_6)
              -- DECOMPILER ERROR at PC271: Unhandled construct in 'MakeBoolean' P1

              if l_0_34 and l_0_34 ~= "NONE" then
                l_0_4.POTENTIAL_SIDE_LOADING = l_0_34
                l_0_5 = l_0_5 + 50
              end
              do
                local l_0_35 = "NONE"
                if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_6) then
                  l_0_35 = "System32"
                  l_0_4.POTENTIAL_SIDE_LOADING = "System32"
                  l_0_5 = l_0_5 + 50
                else
                  if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_6) then
                    l_0_35 = "SysWOW64"
                    l_0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
                    l_0_5 = l_0_5 + 50
                  end
                end
                AppendToRollingQueue("SYSTEM_DLLs", l_0_6, l_0_35, 31104000, 1000)
                if not l_0_8 then
                  return mp.CLEAN
                end
                local l_0_36 = l_0_2:match("([^\\]+)$")
                local l_0_37 = (string.gsub)(l_0_0, "%d+", "0")
                local l_0_38 = (string.gsub)(l_0_6, "%d+", "0")
                local l_0_39 = l_0_36 .. "|" .. l_0_38 .. "|" .. l_0_37
                local l_0_40, l_0_41, l_0_42 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_39, 2, "MarkerRecord_" .. l_0_36)
                if l_0_40 then
                  local l_0_43 = (MpCommon.GetOriginalFileName)(l_0_2)
                  do
                    do
                      if not l_0_43 then
                        local l_0_44 = (sysio.GetPEVersionInfo)(l_0_2)
                        if l_0_44 and l_0_44.OriginalFilename then
                          l_0_43 = l_0_44.OriginalFilename
                          ;
                          (MpCommon.SetOriginalFileName)(l_0_2, l_0_43)
                        end
                      end
                      if l_0_43 then
                        l_0_39 = l_0_43 .. "|" .. l_0_38 .. "|" .. l_0_37
                        l_0_40 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_39, 2, "MarkerRecord_" .. l_0_36)
                      end
                      l_0_4.AppName = l_0_36
                      l_0_4.Dll_FileSize = (sysio.GetFileSize)(l_0_0) or 0
                      l_0_4.Key = l_0_39
                      local l_0_45 = "Appomaly_LoadedDlls_Size"
                      local l_0_46 = 31536000
                      local l_0_47 = 1000
                      local l_0_48 = l_0_36 .. l_0_6
                      l_0_4.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_45, l_0_48) or -1
                      if (l_0_4.Dll_PrevFileSize == -1 or l_0_4.Dll_PrevFileSize == 0) and l_0_4.Dll_FileSize > 0 then
                        AppendToRollingQueue(l_0_45, l_0_48, l_0_4.Dll_FileSize, l_0_46, l_0_47)
                      else
                        l_0_4.Dll_PrevFileSize = tonumber(l_0_4.Dll_PrevFileSize)
                        if l_0_4.Dll_PrevFileSize * 2 < l_0_4.Dll_FileSize or l_0_4.Dll_FileSize < l_0_4.Dll_PrevFileSize / 2 then
                          l_0_4.DllFileSizeAnomalous = true
                        end
                      end
                      if l_0_4.Dll_PrevFileSize == -1 and not l_0_41 then
                        l_0_4.DLLLoadAfterTraining = true
                      end
                      l_0_4.inTraining = l_0_41
                      if not l_0_40 and not l_0_41 and not l_0_4.DllFileSizeAnomalous then
                        return mp.CLEAN
                      end
                      if l_0_4.Dll_PrevFileSize == l_0_4.Dll_FileSize then
                        return mp.CLEAN
                      end
                      if l_0_40 and not l_0_41 then
                        l_0_4.Dll_PathNew = true
                        l_0_5 = l_0_5 + 50
                      end
                      local l_0_49 = "Appomaly_LoadedDlls_Version"
                      local l_0_50 = 31536000
                      local l_0_51 = 1000
                      local l_0_52 = l_0_36 .. l_0_6 .. l_0_4.Dll_FileSize
                      l_0_4.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_49, l_0_52) or ""
                      if l_0_4.Dll_VersionInfo == "" then
                        do
                          if not (sysio.GetPEVersionInfo)(l_0_0) then
                            local l_0_53, l_0_54, l_0_55, l_0_56 = {}
                          end
                          -- DECOMPILER ERROR at PC492: Confused about usage of register: R35 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC497: Confused about usage of register: R35 in 'UnsetPending'

                          -- DECOMPILER ERROR at PC502: Confused about usage of register: R35 in 'UnsetPending'

                          do
                            local l_0_57 = nil
                            l_0_4.Dll_VersionInfo = (l_0_53.OriginalFilename or "") .. "|" .. (l_0_53.CompanyName or "") .. "|" .. (l_0_53.FileDescription or "")
                            -- DECOMPILER ERROR at PC511: Confused about usage of register: R36 in 'UnsetPending'

                            AppendToRollingQueue(l_0_49, l_0_52, (l_0_53.OriginalFilename or "") .. "|" .. (l_0_53.CompanyName or "") .. "|" .. (l_0_53.FileDescription or ""), l_0_50, l_0_51)
                            if (string.find)(l_0_4.Dll_VersionInfo, "Microsoft", 1, true) then
                              return mp.CLEAN
                            end
                            local l_0_58, l_0_59 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_49, l_0_36 .. l_0_6)
                            if not l_0_59 then
                              l_0_4.Dll_PrevVersionInfo = {}
                              if l_0_4.Dll_VersionInfo ~= "||" then
                                for l_0_64,i_2 in ipairs(l_0_59) do
                                  if i_2.value == l_0_4.Dll_VersionInfo then
                                    return mp.CLEAN
                                  end
                                end
                              end
                              do
                                local l_0_65 = function(l_1_0, l_1_1)
  -- function num : 0_0
  l_1_0 = (string.lower)(l_1_0)
  l_1_1 = (string.lower)(l_1_1)
  if (string.match)(l_1_0, "(.-)|(.-)|(.*)") == (string.match)(l_1_1, "(.-)|(.-)|(.*)") or l_1_0 == l_1_1 or "(.-)|(.-)|(.*)" == "(.-)|(.-)|(.*)" then
    return true
  end
  return false
end

                                if l_0_4.Dll_VersionInfo ~= "||" and l_0_65(l_0_4.Dll_VersionInfo, (l_0_4.Dll_PrevVersionInfo).value) then
                                  return mp.CLEAN
                                end
                                local l_0_66, l_0_67, l_0_68 = IsDllInExpectedPath(l_0_6, l_0_1, l_0_7)
                                if l_0_66 and l_0_67 then
                                  return mp.CLEAN
                                end
                                if l_0_66 then
                                  l_0_5 = l_0_5 + 50
                                end
                                if l_0_68 then
                                  l_0_5 = l_0_5 + 50
                                end
                                l_0_4.Known_VulnerableDll = l_0_66
                                l_0_4.Vulnerable_App = l_0_68
                                local l_0_69, l_0_70 = safeJsonSerialize(l_0_4, 100, nil, true)
                                if not l_0_4.POTENTIAL_SIDE_LOADING and not l_0_66 then
                                  return mp.CLEAN
                                end
                                if (MpCommon.StringRegExpSearch)("(desktop|download|onedrive|document|picture)", l_0_0) then
                                  l_0_5 = l_0_5 + 50
                                end
                                if l_0_4.POTENTIAL_SIDE_LOADING or l_0_4.Known_VulnerableDll then
                                  (bm.trigger_sig)("PotentialSideLoading_C_Evaluator", l_0_69)
                                end
                                if (l_0_4.POTENTIAL_SIDE_LOADING and l_0_4.Known_VulnerableDll) or l_0_4.DllAndExecInArchive then
                                  (bm.trigger_sig)("PotentialSideLoading_D2_Evaluator", l_0_69)
                                end
                                local l_0_71 = bm.add_related_string
                                local l_0_72 = "Additional_Info"
                                do
                                  l_0_71(l_0_72, l_0_69 or l_0_70 or "", bm.RelatedStringBMReport)
                                  l_0_71 = bm
                                  l_0_71 = l_0_71.add_related_string
                                  l_0_72 = "Score"
                                  l_0_71(l_0_72, l_0_5, bm.RelatedStringBMReport)
                                  l_0_71 = bm
                                  l_0_71 = l_0_71.add_related_string
                                  l_0_72 = "Anomaly_LoadedDlls_TblInfo"
                                  l_0_71(l_0_72, safeJsonSerialize(l_0_42), bm.RelatedStringBMReport)
                                  l_0_71 = bm
                                  l_0_71 = l_0_71.add_related_file
                                  l_0_72 = l_0_0
                                  l_0_71(l_0_72)
                                  l_0_71 = mp
                                  l_0_71 = l_0_71.INFECTED
                                  do return l_0_71 end
                                  -- DECOMPILER ERROR at PC670: freeLocal<0 in 'ReleaseLocals'

                                  return mp.CLEAN
                                end
                              end
                            end
                          end
                        end
                      end
                    end
                  end
                end
              end
            end
          end
        end
      end
    end
  end
end

