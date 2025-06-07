-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\1a5b3d8ff6402\1.luac 

-- params : ...
-- function num : 0
if (this_sigattrlog[7]).matched and (this_sigattrlog[7]).utf8p1 then
  local l_0_0 = (this_sigattrlog[7]).utf8p1
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
    if (string.find)(l_0_0, "\\windows\\system32\\", 1, true) or (string.find)(l_0_0, "\\windows\\syswow64\\", 1, true) then
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
      local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_13)
      if l_0_14 and l_0_15 then
        do
          if l_0_15.value then
            local l_0_16 = {}
            -- DECOMPILER ERROR at PC179: No list found for R16 , SetList fails

          end
          -- DECOMPILER ERROR at PC182: Overwrote pending register: R17 in 'AssignReg'

          for l_0_20,l_0_21 in ipairs(l_0_15) do
            if (string.find)(l_0_21.value, "UnsignedFile", 1, true) then
              l_0_4.FileDroppedRecently = true
              l_0_4.FileInfo = l_0_15
              l_0_5 = l_0_5 + 50
              l_0_8 = true
              local l_0_22 = (string.match)(l_0_21.value, "Process_Img(.*)")
              if l_0_22 then
                local l_0_23 = contains
                local l_0_24 = l_0_22
                local l_0_25 = {}
                -- DECOMPILER ERROR at PC212: No list found for R24 , SetList fails

                -- DECOMPILER ERROR at PC217: Overwrote pending register: R22 in 'AssignReg'

                -- DECOMPILER ERROR at PC220: Overwrote pending register: R25 in 'AssignReg'

                -- DECOMPILER ERROR at PC221: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC222: Overwrote pending register: R27 in 'AssignReg'

                -- DECOMPILER ERROR at PC227: Overwrote pending register: R5 in 'AssignReg'

              end
              do
                -- DECOMPILER ERROR at PC228: Overwrote pending register: R22 in 'AssignReg'

                -- DECOMPILER ERROR at PC230: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC231: Overwrote pending register: R24 in 'AssignReg'

                if (l_0_23 and not l_0_23) or (l_0_23.find)(l_0_24, l_0_25, 1, true) then
                  local l_0_26 = (string.match)(l_0_21.value, "%[(.*)%]")
                  for l_0_30 in (string.gmatch)(l_0_26, "([^|]+)") do
                    -- DECOMPILER ERROR at PC250: Overwrote pending register: R5 in 'AssignReg'

                    -- DECOMPILER ERROR at PC253: Overwrote pending register: R5 in 'AssignReg'

                  end
                end
                if l_0_30 == "SLF:Aurora.A!rfn" or l_0_30 == "SLF:HighRiskHasMotW" then
                  do
                    do break end
                    -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out IF_STMT

                    -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC257: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
          end
          if not l_0_4.FileDroppedRecently then
            return mp.CLEAN
          end
          if not l_0_14 then
            (bm.add_related_string)("Error", l_0_15, bm.RelatedStringBMReport)
          end
          do
            if not l_0_4.FileDroppedRecently then
              local l_0_31, l_0_32 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_13)
              if l_0_31 and l_0_32 then
                for l_0_36,l_0_37 in ipairs(l_0_32) do
                  -- DECOMPILER ERROR at PC308: Overwrote pending register: R5 in 'AssignReg'

                  if (string.find)(l_0_37.value, "UnsignedFile", 1, true) and FiletimeToDaysElapsed(l_0_37.insert_time) < 1 then
                    local l_0_38 = (string.match)(l_0_37.value, "Process_Img(.*)")
                    if l_0_38 then
                      local l_0_39 = contains
                      local l_0_40 = l_0_38
                      local l_0_41 = {}
                      -- DECOMPILER ERROR at PC320: Overwrote pending register: R28 in 'AssignReg'

                      -- DECOMPILER ERROR at PC323: No list found for R26 , SetList fails

                      -- DECOMPILER ERROR at PC327: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC328: Overwrote pending register: R24 in 'AssignReg'

                      -- DECOMPILER ERROR at PC331: Overwrote pending register: R27 in 'AssignReg'

                      -- DECOMPILER ERROR at PC332: Overwrote pending register: R28 in 'AssignReg'

                      -- DECOMPILER ERROR at PC333: Overwrote pending register: R29 in 'AssignReg'

                      -- DECOMPILER ERROR at PC338: Overwrote pending register: R5 in 'AssignReg'

                    end
                    do
                      -- DECOMPILER ERROR at PC339: Overwrote pending register: R24 in 'AssignReg'

                      -- DECOMPILER ERROR at PC341: Overwrote pending register: R25 in 'AssignReg'

                      -- DECOMPILER ERROR at PC342: Overwrote pending register: R26 in 'AssignReg'

                      if (l_0_39 and not l_0_39) or (l_0_39.find)(l_0_40, l_0_41, 1, true) then
                        local l_0_42 = (string.match)(l_0_37.value, "%[(.*)%]")
                        for l_0_46 in (string.gmatch)(l_0_42, "([^|]+)") do
                          -- DECOMPILER ERROR at PC361: Overwrote pending register: R30 in 'AssignReg'

                          -- DECOMPILER ERROR at PC368: Overwrote pending register: R5 in 'AssignReg'

                          -- DECOMPILER ERROR at PC371: Overwrote pending register: R5 in 'AssignReg'

                        end
                      end
                      if not (string.find)("svchost.exe", "Aurora.A!rfn", 1, true) or l_0_46 == "SLF:HighRiskHasMotW" then
                        do
                          do break end
                          -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC375: LeaveBlock: unexpected jumping out IF_STMT

                        end
                      end
                    end
                  end
                end
                if not l_0_4.FileDroppedRecently_LongTermStrg then
                  return mp.CLEAN
                end
              end
            end
            local l_0_47, l_0_48 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_6)
            -- DECOMPILER ERROR at PC391: Unhandled construct in 'MakeBoolean' P1

            if l_0_48 and l_0_48 ~= "NONE" then
              l_0_4.POTENTIAL_SIDE_LOADING = l_0_48
              -- DECOMPILER ERROR at PC392: Overwrote pending register: R5 in 'AssignReg'

            end
            do
              local l_0_49 = "NONE"
              if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_6) then
                l_0_49 = "System32"
                l_0_4.POTENTIAL_SIDE_LOADING = "System32"
                -- DECOMPILER ERROR at PC405: Overwrote pending register: R5 in 'AssignReg'

              else
                if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_6) then
                  l_0_49 = "SysWOW64"
                  l_0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
                  -- DECOMPILER ERROR at PC417: Overwrote pending register: R5 in 'AssignReg'

                end
              end
              AppendToRollingQueue("SYSTEM_DLLs", l_0_6, l_0_49, 31104000, 1000)
              if not l_0_8 then
                return mp.CLEAN
              end
              local l_0_50 = l_0_2:match("([^\\]+)$")
              local l_0_51 = (string.gsub)(l_0_0, "%d+", "0")
              local l_0_52 = (string.gsub)(l_0_6, "%d+", "0")
              local l_0_53 = l_0_50 .. "|" .. l_0_52 .. "|" .. l_0_51
              local l_0_54, l_0_55, l_0_56 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_53, 2, "MarkerRecord_" .. l_0_50)
              if l_0_54 then
                local l_0_57 = (MpCommon.GetOriginalFileName)(l_0_2)
                do
                  do
                    if not l_0_57 then
                      local l_0_58 = (sysio.GetPEVersionInfo)(l_0_2)
                      if l_0_58 and l_0_58.OriginalFilename then
                        l_0_57 = l_0_58.OriginalFilename
                        ;
                        (MpCommon.SetOriginalFileName)(l_0_2, l_0_57)
                      end
                    end
                    if l_0_57 then
                      l_0_53 = l_0_57 .. "|" .. l_0_52 .. "|" .. l_0_51
                      l_0_54 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_53, 2, "MarkerRecord_" .. l_0_50)
                    end
                    l_0_4.AppName = l_0_50
                    l_0_4.Dll_FileSize = (sysio.GetFileSize)(l_0_0) or 0
                    l_0_4.Key = l_0_53
                    local l_0_59 = "Appomaly_LoadedDlls_Size"
                    local l_0_60 = 31536000
                    local l_0_61 = 1000
                    local l_0_62 = l_0_50 .. l_0_6
                    l_0_4.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_59, l_0_62) or -1
                    if (l_0_4.Dll_PrevFileSize == -1 or l_0_4.Dll_PrevFileSize == 0) and l_0_4.Dll_FileSize > 0 then
                      AppendToRollingQueue(l_0_59, l_0_62, l_0_4.Dll_FileSize, l_0_60, l_0_61)
                    else
                      l_0_4.Dll_PrevFileSize = tonumber(l_0_4.Dll_PrevFileSize)
                      if l_0_4.Dll_PrevFileSize * 2 < l_0_4.Dll_FileSize or l_0_4.Dll_FileSize < l_0_4.Dll_PrevFileSize / 2 then
                        l_0_4.DllFileSizeAnomalous = true
                        l_0_4.FileSizeDiffRatio = l_0_4.Dll_FileSize * 100 / l_0_4.Dll_PrevFileSize
                        l_0_4.FileSizeDiffRatio = l_0_4.Dll_FileSize * 100 / l_0_4.Dll_PrevFileSize
                        -- DECOMPILER ERROR at PC570: Overwrote pending register: R5 in 'AssignReg'

                      end
                    end
                    if (l_0_4.FileSizeDiffRatio >= 30 or l_0_4.Dll_PrevFileSize == -1) and not l_0_55 then
                      l_0_4.DLLLoadAfterTraining = true
                    end
                    l_0_4.inTraining = l_0_55
                    if not l_0_54 and not l_0_55 and not l_0_4.DllFileSizeAnomalous then
                      return mp.CLEAN
                    end
                    if l_0_4.Dll_PrevFileSize == l_0_4.Dll_FileSize then
                      return mp.CLEAN
                    end
                    if l_0_54 and not l_0_55 then
                      l_0_4.Dll_PathNew = true
                      -- DECOMPILER ERROR at PC600: Overwrote pending register: R5 in 'AssignReg'

                      l_0_4.TableInfo = l_0_56
                    end
                    local l_0_63 = "Appomaly_LoadedDlls_Version"
                    local l_0_64 = 31536000
                    local l_0_65 = 1000
                    local l_0_66 = l_0_50 .. l_0_6 .. l_0_4.Dll_FileSize
                    l_0_4.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_63, l_0_66) or ""
                    if l_0_4.Dll_VersionInfo == "" then
                      do
                        if not (sysio.GetPEVersionInfo)(l_0_0) then
                          local l_0_67, l_0_68, l_0_69, l_0_70 = {}
                        end
                        -- DECOMPILER ERROR at PC627: Confused about usage of register: R33 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC632: Confused about usage of register: R33 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC637: Confused about usage of register: R33 in 'UnsetPending'

                        do
                          local l_0_71 = nil
                          l_0_4.Dll_VersionInfo = (l_0_67.OriginalFilename or "") .. "|" .. (l_0_67.CompanyName or "") .. "|" .. (l_0_67.FileDescription or "")
                          -- DECOMPILER ERROR at PC646: Confused about usage of register: R34 in 'UnsetPending'

                          AppendToRollingQueue(l_0_63, l_0_66, (l_0_67.OriginalFilename or "") .. "|" .. (l_0_67.CompanyName or "") .. "|" .. (l_0_67.FileDescription or ""), l_0_64, l_0_65)
                          if (string.find)(l_0_4.Dll_VersionInfo, "Microsoft", 1, true) then
                            return mp.CLEAN
                          end
                          local l_0_72 = function(l_1_0, l_1_1)
  -- function num : 0_0
  l_1_0 = (string.lower)(l_1_0)
  l_1_1 = (string.lower)(l_1_1)
  if (string.match)(l_1_0, "(.-)|(.-)|(.*)") == (string.match)(l_1_1, "(.-)|(.-)|(.*)") or l_1_0 == l_1_1 or "(.-)|(.-)|(.*)" == "(.-)|(.-)|(.*)" then
    return true
  end
  return false
end

                          local l_0_73, l_0_74 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_63, l_0_50 .. l_0_6)
                          do
                            if l_0_74.value then
                              local l_0_75 = {}
                              -- DECOMPILER ERROR at PC676: No list found for R36 , SetList fails

                            end
                            -- DECOMPILER ERROR at PC686: Overwrote pending register: R37 in 'AssignReg'

                            if l_0_74 or l_0_4.Dll_VersionInfo ~= "||" then
                              for l_0_80,i_2 in ipairs(l_0_74) do
                                if l_0_72(i_2.value, l_0_4.Dll_VersionInfo) then
                                  return mp.CLEAN
                                end
                              end
                            end
                            do
                              if l_0_4.Dll_VersionInfo ~= "||" and l_0_72(l_0_4.Dll_VersionInfo, (l_0_4.Dll_PrevVersionInfo).value) then
                                return mp.CLEAN
                              end
                              -- DECOMPILER ERROR at PC716: Overwrote pending register: R5 in 'AssignReg'

                              if l_0_4.Dll_PrevVersionInfo ~= "||" then
                                local l_0_81, l_0_82, l_0_83 = IsDllInExpectedPath(l_0_6, l_0_1, l_0_7)
                                if l_0_81 and l_0_82 then
                                  return mp.CLEAN
                                end
                                -- DECOMPILER ERROR at PC731: Overwrote pending register: R5 in 'AssignReg'

                                -- DECOMPILER ERROR at PC734: Overwrote pending register: R5 in 'AssignReg'

                                if not l_0_81 or l_0_83 then
                                  l_0_4.Known_VulnerableDll = l_0_81
                                  l_0_4.Vulnerable_App = l_0_83
                                  if not l_0_4.POTENTIAL_SIDE_LOADING and not l_0_81 then
                                    return mp.CLEAN
                                  end
                                  -- DECOMPILER ERROR at PC752: Overwrote pending register: R5 in 'AssignReg'

                                  if (MpCommon.StringRegExpSearch)("\\\\(desktop|download|onedrive|document|picture)", l_0_0) then
                                    local l_0_84 = contains
                                    local l_0_85 = l_0_0
                                    local l_0_86 = {}
                                    -- DECOMPILER ERROR at PC758: No list found for R41 , SetList fails

                                    -- DECOMPILER ERROR at PC762: Overwrote pending register: R5 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC764: Overwrote pending register: R39 in 'AssignReg'

                                    -- DECOMPILER ERROR at PC767: Overwrote pending register: R42 in 'AssignReg'

                                    if l_0_84 then
                                      l_0_84 = l_0_84(l_0_85, l_0_86, "program files", true)
                                      -- DECOMPILER ERROR at PC770: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC773: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC774: Overwrote pending register: R41 in 'AssignReg'

                                      if l_0_86 then
                                        l_0_86("PotentialSideLoading_C_Evaluator", l_0_84)
                                      end
                                      -- DECOMPILER ERROR at PC778: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC781: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC784: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC787: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC788: Overwrote pending register: R41 in 'AssignReg'

                                      if (l_0_86 and l_0_86) or l_0_86 then
                                        l_0_86("PotentialSideLoading_D2_Evaluator", l_0_84)
                                      end
                                      -- DECOMPILER ERROR at PC792: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC795: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC800: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC801: Overwrote pending register: R41 in 'AssignReg'

                                      if (l_0_86 and l_0_86) or l_0_5 >= 150 then
                                        l_0_86("PotentialSideLoading_D2_Evaluator", l_0_84)
                                      end
                                      -- DECOMPILER ERROR at PC805: Overwrote pending register: R41 in 'AssignReg'

                                      -- DECOMPILER ERROR at PC806: Overwrote pending register: R41 in 'AssignReg'

                                      local l_0_87 = "Additional_Info"
                                      do
                                        l_0_86(l_0_87, l_0_84 or l_0_85 or "", bm.RelatedStringBMReport)
                                        -- DECOMPILER ERROR at PC816: Overwrote pending register: R41 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC817: Overwrote pending register: R41 in 'AssignReg'

                                        l_0_87 = "Score"
                                        l_0_86(l_0_87, l_0_5, bm.RelatedStringBMReport)
                                        -- DECOMPILER ERROR at PC823: Overwrote pending register: R41 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC824: Overwrote pending register: R41 in 'AssignReg'

                                        l_0_87 = "Anomaly_LoadedDlls_TblInfo"
                                        l_0_86(l_0_87, safeJsonSerialize(l_0_56), bm.RelatedStringBMReport)
                                        -- DECOMPILER ERROR at PC832: Overwrote pending register: R41 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC833: Overwrote pending register: R41 in 'AssignReg'

                                        l_0_87 = l_0_0
                                        l_0_86(l_0_87)
                                        -- DECOMPILER ERROR at PC836: Overwrote pending register: R41 in 'AssignReg'

                                        -- DECOMPILER ERROR at PC837: Overwrote pending register: R41 in 'AssignReg'

                                        do return l_0_86 end
                                        -- DECOMPILER ERROR at PC839: freeLocal<0 in 'ReleaseLocals'

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
    end
  end
end

