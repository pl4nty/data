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
    local l_0_5 = l_0_0:match("([^\\]+)$")
    local l_0_6 = l_0_2:match("([^\\]+)$")
    if (string.find)(l_0_3, "\\windows\\system32\\", 1, true) or (string.find)(l_0_3, "\\windows\\syswow64\\", 1, true) then
      return mp.CLEAN
    end
    local l_0_7 = nil
    if not l_0_1:match("\\device\\vhdharddisk.-\\(.*)") then
      local l_0_8, l_0_9 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", l_0_5, l_0_1, false)
      local l_0_10, l_0_11 = IsKeyValuePairInRollingQueue("ArchivesWithExec_FileName", l_0_6, l_0_1, false)
      if l_0_8 and l_0_10 then
        l_0_4.DllAndExecInArchive = true
        l_0_4.Archive_Exe = l_0_11
        l_0_4.Archive_Dll = l_0_9
        l_0_7 = true
      end
      local l_0_12 = 0
      local l_0_13 = l_0_1 .. "\\" .. l_0_5
      l_0_13 = (string.gsub)(l_0_13, "\\", "\\\\")
      l_0_13 = l_0_13:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
      local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_13)
      if l_0_14 and l_0_15 then
        for l_0_19,l_0_20 in ipairs(l_0_15) do
          if (string.find)(l_0_20.value, "UnsignedFile", 1, true) then
            l_0_4.FileDroppedRecently_LongTermStrg = true
            l_0_4.FileDropperInfo = l_0_15
            l_0_7 = true
            l_0_12 = l_0_12 + 50
            if (string.find)(l_0_20.value, "FileAttributes", 1, true) then
              local l_0_21 = (string.match)(l_0_20.value, "%[(.*)%]")
              for l_0_25 in (string.gmatch)(l_0_21, "([^|]+)") do
                if l_0_25 ~= "SLF:Aurora.A!rfn" then
                  l_0_12 = l_0_12 + 1
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
          local l_0_26 = l_0_2:match("([^\\]+)$")
          local l_0_27 = (string.gsub)(l_0_0, "%d+", "0")
          local l_0_28 = (string.gsub)(l_0_5, "%d+", "0")
          local l_0_29 = l_0_26 .. "|" .. l_0_28 .. "|" .. l_0_27
          local l_0_30, l_0_31, l_0_32 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_29, 2, "MarkerRecord_" .. l_0_26)
          if l_0_30 then
            local l_0_33 = (MpCommon.GetOriginalFileName)(l_0_2)
            do
              do
                if not l_0_33 then
                  local l_0_34 = (sysio.GetPEVersionInfo)(l_0_2)
                  if l_0_34 and l_0_34.OriginalFilename then
                    l_0_33 = l_0_34.OriginalFilename
                    ;
                    (MpCommon.SetOriginalFileName)(l_0_2, l_0_33)
                  end
                end
                if l_0_33 then
                  l_0_29 = l_0_33 .. "|" .. l_0_28 .. "|" .. l_0_27
                  l_0_30 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_29, 2, "MarkerRecord_" .. l_0_26)
                end
                l_0_4.AppName = l_0_26
                l_0_4.Dll_FileSize = (sysio.GetFileSize)(l_0_0) or 0
                l_0_4.Key = l_0_29
                local l_0_35 = "Appomaly_LoadedDlls_Size"
                local l_0_36 = 31536000
                local l_0_37 = 1000
                local l_0_38 = l_0_26 .. l_0_5
                l_0_4.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_35, l_0_38) or -1
                if (l_0_4.Dll_PrevFileSize == -1 or l_0_4.Dll_PrevFileSize == 0) and l_0_4.Dll_FileSize > 0 then
                  AppendToRollingQueue(l_0_35, l_0_38, l_0_4.Dll_FileSize, l_0_36, l_0_37)
                else
                  l_0_4.Dll_PrevFileSize = tonumber(l_0_4.Dll_PrevFileSize)
                  if l_0_4.Dll_PrevFileSize * 2 < l_0_4.Dll_FileSize or l_0_4.Dll_FileSize < l_0_4.Dll_PrevFileSize / 2 then
                    l_0_4.DllFileSizeAnomalous = true
                  end
                end
                if l_0_4.Dll_PrevFileSize == -1 and not l_0_31 then
                  l_0_4.DLLLoadAfterTraining = true
                end
                l_0_4.inTraining = l_0_31
                if not l_0_30 and not l_0_31 and not l_0_4.DllFileSizeAnomalous then
                  return mp.CLEAN
                end
                if l_0_4.Dll_PrevFileSize == l_0_4.Dll_FileSize then
                  return mp.CLEAN
                end
                if l_0_30 and not l_0_31 then
                  l_0_4.Dll_PathNew = true
                  l_0_12 = l_0_12 + 5
                end
                local l_0_39, l_0_40 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_5)
                -- DECOMPILER ERROR at PC368: Unhandled construct in 'MakeBoolean' P1

                if l_0_40 and l_0_40 ~= "NONE" then
                  l_0_4.POTENTIAL_SIDE_LOADING = l_0_40
                  l_0_12 = l_0_12 + 50
                end
                do
                  local l_0_41 = "NONE"
                  if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_5) then
                    l_0_41 = "System32"
                    l_0_4.POTENTIAL_SIDE_LOADING = "System32"
                    l_0_12 = l_0_12 + 50
                  else
                    if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_5) then
                      l_0_41 = "SysWOW64"
                      l_0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
                      l_0_12 = l_0_12 + 50
                    end
                  end
                  AppendToRollingQueue("SYSTEM_DLLs", l_0_5, l_0_41, 31104000, 1000)
                  local l_0_42, l_0_43 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_13)
                  if l_0_42 and l_0_43 then
                    for l_0_47,l_0_48 in ipairs(l_0_43) do
                      if (string.find)(l_0_48.value, "FileAttributes", 1, true) or (string.find)(l_0_48.value, "UnsignedFile", 1, true) then
                        l_0_4.FileDroppedRecently = true
                        l_0_4.FileInfo = l_0_43
                        l_0_12 = l_0_12 + 50
                        l_0_7 = true
                      end
                    end
                    if not l_0_4.FileDroppedRecently then
                      return mp.CLEAN
                    end
                  end
                  if not l_0_42 then
                    (bm.add_related_string)("Error", l_0_43, bm.RelatedStringBMReport)
                  end
                  if not l_0_7 then
                    return mp.CLEAN
                  end
                  local l_0_49 = "Appomaly_LoadedDlls_Version"
                  local l_0_50 = 31536000
                  local l_0_51 = 1000
                  local l_0_52 = l_0_26 .. l_0_5 .. l_0_4.Dll_FileSize
                  l_0_4.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_49, l_0_52) or ""
                  if l_0_4.Dll_VersionInfo == "" then
                    do
                      if not (sysio.GetPEVersionInfo)(l_0_0) then
                        local l_0_53, l_0_54, l_0_55, l_0_56 = {}
                      end
                      -- DECOMPILER ERROR at PC485: Confused about usage of register: R35 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC490: Confused about usage of register: R35 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC495: Confused about usage of register: R35 in 'UnsetPending'

                      do
                        local l_0_57 = nil
                        l_0_4.Dll_VersionInfo = (l_0_53.OriginalFilename or "") .. "|" .. (l_0_53.CompanyName or "") .. "|" .. (l_0_53.FileDescription or "")
                        -- DECOMPILER ERROR at PC504: Confused about usage of register: R36 in 'UnsetPending'

                        AppendToRollingQueue(l_0_49, l_0_52, (l_0_53.OriginalFilename or "") .. "|" .. (l_0_53.CompanyName or "") .. "|" .. (l_0_53.FileDescription or ""), l_0_50, l_0_51)
                        if (string.find)(l_0_4.Dll_VersionInfo, "Microsoft", 1, true) then
                          return mp.CLEAN
                        end
                        local l_0_58, l_0_59 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_49, l_0_26 .. l_0_5)
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
                            if l_0_4.Dll_VersionInfo ~= "||" and l_0_4.Dll_VersionInfo == (l_0_4.Dll_PrevVersionInfo).value then
                              return mp.CLEAN
                            end
                            local l_0_65, l_0_66, l_0_67 = IsDllInExpectedPath(l_0_5, l_0_1, l_0_6)
                            if l_0_65 and l_0_66 then
                              return mp.CLEAN
                            end
                            if l_0_65 then
                              l_0_12 = l_0_12 + 50
                            end
                            if l_0_67 then
                              l_0_12 = l_0_12 + 50
                            end
                            l_0_4.Known_VulnerableDll = l_0_65
                            l_0_4.Vulnerable_App = l_0_67
                            local l_0_68, l_0_69 = safeJsonSerialize(l_0_4, 100, nil, true)
                            if l_0_4.POTENTIAL_SIDE_LOADING then
                              (bm.trigger_sig)("PotentialSideLoading_C_Evaluator", l_0_68)
                            end
                            local l_0_70 = bm.add_related_string
                            local l_0_71 = "Additional_Info"
                            do
                              l_0_70(l_0_71, l_0_68 or l_0_69 or "", bm.RelatedStringBMReport)
                              l_0_70 = bm
                              l_0_70 = l_0_70.add_related_string
                              l_0_71 = "Score"
                              l_0_70(l_0_71, l_0_12, bm.RelatedStringBMReport)
                              l_0_70 = bm
                              l_0_70 = l_0_70.add_related_string
                              l_0_71 = "Anomaly_LoadedDlls_TblInfo"
                              l_0_70(l_0_71, safeJsonSerialize(l_0_32), bm.RelatedStringBMReport)
                              l_0_70 = bm
                              l_0_70 = l_0_70.add_related_file
                              l_0_71 = l_0_0
                              l_0_70(l_0_71)
                              l_0_70 = mp
                              l_0_70 = l_0_70.INFECTED
                              do return l_0_70 end
                              -- DECOMPILER ERROR at PC627: freeLocal<0 in 'ReleaseLocals'

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

