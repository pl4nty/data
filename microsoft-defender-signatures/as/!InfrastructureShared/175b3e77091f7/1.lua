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
      local l_0_14, l_0_15 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_13)
      if l_0_14 and l_0_15 then
        for l_0_19,l_0_20 in ipairs(l_0_15) do
          if (string.find)(l_0_20.value, "UnsignedFile", 1, true) then
            l_0_4.FileDroppedRecently = true
            l_0_4.FileInfo = l_0_15
            l_0_5 = l_0_5 + 50
            l_0_8 = true
            local l_0_21 = (string.match)(l_0_20.value, "Process_Img(.*)")
            if l_0_21 then
              local l_0_22 = contains
              local l_0_23 = l_0_21
              local l_0_24 = {}
              -- DECOMPILER ERROR at PC181: No list found for R24 , SetList fails

              -- DECOMPILER ERROR at PC186: Overwrote pending register: R22 in 'AssignReg'

              -- DECOMPILER ERROR at PC189: Overwrote pending register: R25 in 'AssignReg'

              if l_0_22 then
                do
                  l_0_22, l_0_24 = l_0_22(l_0_23, l_0_24), {"program files", "WinRAR.exe", "7z.exe"}
                  -- DECOMPILER ERROR at PC196: Overwrote pending register: R5 in 'AssignReg'

                  -- DECOMPILER ERROR at PC199: Overwrote pending register: R23 in 'AssignReg'

                  if not l_0_22 or (string.find)(l_0_23, "FileAttributes", 1, true) then
                    local l_0_25 = (string.match)(l_0_20.value, "%[(.*)%]")
                    for l_0_29 in (string.gmatch)(l_0_25, "([^|]+)") do
                      -- DECOMPILER ERROR at PC219: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC222: Overwrote pending register: R5 in 'AssignReg'

                    end
                  end
                  if l_0_29 == "SLF:Aurora.A!rfn" or l_0_29 == "SLF:HighRiskHasMotW" then
                    do
                      do break end
                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC226: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
        if not l_0_4.FileDroppedRecently then
          return mp.CLEAN
        end
      end
      if not l_0_14 then
        (bm.add_related_string)("Error", l_0_15, bm.RelatedStringBMReport)
      end
      do
        if not l_0_4.FileDroppedRecently then
          local l_0_30, l_0_31 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_13)
          if l_0_30 and l_0_31 then
            for l_0_35,l_0_36 in ipairs(l_0_31) do
              if (string.find)(l_0_36.value, "UnsignedFile", 1, true) and FiletimeToDaysElapsed(l_0_36.insert_time) < 1 then
                l_0_4.FileDroppedRecently_LongTermStrg = true
                l_0_4.FileDropperInfo = l_0_31
                l_0_8 = true
                -- DECOMPILER ERROR at PC277: Overwrote pending register: R5 in 'AssignReg'

                local l_0_37 = (string.match)(l_0_36.value, "Process_Img(.*)")
                if l_0_37 then
                  local l_0_38 = contains
                  local l_0_39 = l_0_37
                  local l_0_40 = {}
                  -- DECOMPILER ERROR at PC289: No list found for R26 , SetList fails

                  -- DECOMPILER ERROR at PC293: Overwrote pending register: R5 in 'AssignReg'

                  -- DECOMPILER ERROR at PC294: Overwrote pending register: R24 in 'AssignReg'

                  -- DECOMPILER ERROR at PC297: Overwrote pending register: R27 in 'AssignReg'

                  if l_0_38 then
                    do
                      l_0_38, l_0_40 = l_0_38(l_0_39, l_0_40), {"program files", "WinRAR.exe", "7z.exe"}
                      -- DECOMPILER ERROR at PC304: Overwrote pending register: R5 in 'AssignReg'

                      -- DECOMPILER ERROR at PC307: Overwrote pending register: R25 in 'AssignReg'

                      if not l_0_38 or (string.find)(l_0_39, "FileAttributes", 1, true) then
                        local l_0_41 = (string.match)(l_0_36.value, "%[(.*)%]")
                        for l_0_45 in (string.gmatch)(l_0_41, "([^|]+)") do
                          -- DECOMPILER ERROR at PC327: Overwrote pending register: R5 in 'AssignReg'

                          -- DECOMPILER ERROR at PC330: Overwrote pending register: R5 in 'AssignReg'

                        end
                      end
                      if l_0_45 == "SLF:Aurora.A!rfn" or l_0_45 == "SLF:HighRiskHasMotW" then
                        do
                          do break end
                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC334: LeaveBlock: unexpected jumping out IF_STMT

                        end
                      end
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
        local l_0_46, l_0_47 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_6)
        -- DECOMPILER ERROR at PC350: Unhandled construct in 'MakeBoolean' P1

        if l_0_47 and l_0_47 ~= "NONE" then
          l_0_4.POTENTIAL_SIDE_LOADING = l_0_47
          -- DECOMPILER ERROR at PC351: Overwrote pending register: R5 in 'AssignReg'

        end
        do
          local l_0_48 = "NONE"
          if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_6) then
            l_0_48 = "System32"
            l_0_4.POTENTIAL_SIDE_LOADING = "System32"
            -- DECOMPILER ERROR at PC364: Overwrote pending register: R5 in 'AssignReg'

          else
            if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_6) then
              l_0_48 = "SysWOW64"
              l_0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
              -- DECOMPILER ERROR at PC376: Overwrote pending register: R5 in 'AssignReg'

            end
          end
          AppendToRollingQueue("SYSTEM_DLLs", l_0_6, l_0_48, 31104000, 1000)
          if not l_0_8 then
            return mp.CLEAN
          end
          local l_0_49 = l_0_2:match("([^\\]+)$")
          local l_0_50 = (string.gsub)(l_0_0, "%d+", "0")
          local l_0_51 = (string.gsub)(l_0_6, "%d+", "0")
          local l_0_52 = l_0_49 .. "|" .. l_0_51 .. "|" .. l_0_50
          local l_0_53, l_0_54, l_0_55 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_52, 2, "MarkerRecord_" .. l_0_49)
          if l_0_53 then
            local l_0_56 = (MpCommon.GetOriginalFileName)(l_0_2)
            do
              do
                if not l_0_56 then
                  local l_0_57 = (sysio.GetPEVersionInfo)(l_0_2)
                  if l_0_57 and l_0_57.OriginalFilename then
                    l_0_56 = l_0_57.OriginalFilename
                    ;
                    (MpCommon.SetOriginalFileName)(l_0_2, l_0_56)
                  end
                end
                if l_0_56 then
                  l_0_52 = l_0_56 .. "|" .. l_0_51 .. "|" .. l_0_50
                  l_0_53 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_52, 2, "MarkerRecord_" .. l_0_49)
                end
                l_0_4.AppName = l_0_49
                l_0_4.Dll_FileSize = (sysio.GetFileSize)(l_0_0) or 0
                l_0_4.Key = l_0_52
                local l_0_58 = "Appomaly_LoadedDlls_Size"
                local l_0_59 = 31536000
                local l_0_60 = 1000
                local l_0_61 = l_0_49 .. l_0_6
                l_0_4.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_58, l_0_61) or -1
                if (l_0_4.Dll_PrevFileSize == -1 or l_0_4.Dll_PrevFileSize == 0) and l_0_4.Dll_FileSize > 0 then
                  AppendToRollingQueue(l_0_58, l_0_61, l_0_4.Dll_FileSize, l_0_59, l_0_60)
                else
                  l_0_4.Dll_PrevFileSize = tonumber(l_0_4.Dll_PrevFileSize)
                  if l_0_4.Dll_PrevFileSize * 2 < l_0_4.Dll_FileSize or l_0_4.Dll_FileSize < l_0_4.Dll_PrevFileSize / 2 then
                    l_0_4.DllFileSizeAnomalous = true
                  end
                end
                if l_0_4.Dll_PrevFileSize == -1 and not l_0_54 then
                  l_0_4.DLLLoadAfterTraining = true
                end
                l_0_4.inTraining = l_0_54
                if not l_0_53 and not l_0_54 and not l_0_4.DllFileSizeAnomalous then
                  return mp.CLEAN
                end
                if l_0_4.Dll_PrevFileSize == l_0_4.Dll_FileSize then
                  return mp.CLEAN
                end
                if l_0_53 and not l_0_54 then
                  l_0_4.Dll_PathNew = true
                  -- DECOMPILER ERROR at PC545: Overwrote pending register: R5 in 'AssignReg'

                end
                local l_0_62 = "Appomaly_LoadedDlls_Version"
                local l_0_63 = 31536000
                local l_0_64 = 1000
                local l_0_65 = l_0_49 .. l_0_6 .. l_0_4.Dll_FileSize
                l_0_4.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_62, l_0_65) or ""
                if l_0_4.Dll_VersionInfo == "" then
                  do
                    if not (sysio.GetPEVersionInfo)(l_0_0) then
                      local l_0_66, l_0_67, l_0_68, l_0_69 = {}
                    end
                    -- DECOMPILER ERROR at PC571: Confused about usage of register: R33 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC576: Confused about usage of register: R33 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC581: Confused about usage of register: R33 in 'UnsetPending'

                    do
                      local l_0_70 = nil
                      l_0_4.Dll_VersionInfo = (l_0_66.OriginalFilename or "") .. "|" .. (l_0_66.CompanyName or "") .. "|" .. (l_0_66.FileDescription or "")
                      -- DECOMPILER ERROR at PC590: Confused about usage of register: R34 in 'UnsetPending'

                      AppendToRollingQueue(l_0_62, l_0_65, (l_0_66.OriginalFilename or "") .. "|" .. (l_0_66.CompanyName or "") .. "|" .. (l_0_66.FileDescription or ""), l_0_63, l_0_64)
                      if (string.find)(l_0_4.Dll_VersionInfo, "Microsoft", 1, true) then
                        return mp.CLEAN
                      end
                      local l_0_71 = function(l_1_0, l_1_1)
  -- function num : 0_0
  l_1_0 = (string.lower)(l_1_0)
  l_1_1 = (string.lower)(l_1_1)
  if (string.match)(l_1_0, "(.-)|(.-)|(.*)") == (string.match)(l_1_1, "(.-)|(.-)|(.*)") or l_1_0 == l_1_1 or "(.-)|(.-)|(.*)" == "(.-)|(.-)|(.*)" then
    return true
  end
  return false
end

                      local l_0_72, l_0_73 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_62, l_0_49 .. l_0_6)
                      if not l_0_73 then
                        l_0_4.Dll_PrevVersionInfo = {}
                        if l_0_4.Dll_VersionInfo ~= "||" then
                          for l_0_78,i_2 in ipairs(l_0_73) do
                            if l_0_71(i_2.value, l_0_4.Dll_VersionInfo) then
                              return mp.CLEAN
                            end
                          end
                        end
                        do
                          if l_0_4.Dll_VersionInfo ~= "||" and l_0_71(l_0_4.Dll_VersionInfo, (l_0_4.Dll_PrevVersionInfo).value) then
                            return mp.CLEAN
                          end
                          local l_0_79, l_0_80, l_0_81 = IsDllInExpectedPath(l_0_6, l_0_1, l_0_7)
                          if l_0_79 and l_0_80 then
                            return mp.CLEAN
                          end
                          -- DECOMPILER ERROR at PC664: Overwrote pending register: R5 in 'AssignReg'

                          -- DECOMPILER ERROR at PC667: Overwrote pending register: R5 in 'AssignReg'

                          if not l_0_79 or l_0_81 then
                            l_0_4.Known_VulnerableDll = l_0_79
                            l_0_4.Vulnerable_App = l_0_81
                            l_0_4.Score = l_0_5
                            local l_0_82, l_0_83 = safeJsonSerialize(l_0_4, 100, nil, true)
                            if not l_0_4.POTENTIAL_SIDE_LOADING and not l_0_79 then
                              return mp.CLEAN
                            end
                            -- DECOMPILER ERROR at PC692: Overwrote pending register: R5 in 'AssignReg'

                            if (MpCommon.StringRegExpSearch)("(desktop|download|onedrive|document|picture)", l_0_0) then
                              local l_0_84 = contains
                              local l_0_85 = l_0_0
                              local l_0_86 = {}
                              -- DECOMPILER ERROR at PC698: No list found for R43 , SetList fails

                              -- DECOMPILER ERROR at PC702: Overwrote pending register: R5 in 'AssignReg'

                              -- DECOMPILER ERROR at PC703: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC706: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC707: Overwrote pending register: R41 in 'AssignReg'

                              if not l_0_84 or l_0_84 then
                                l_0_84(l_0_85, l_0_86)
                              end
                              -- DECOMPILER ERROR at PC711: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC714: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC717: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC720: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC721: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC722: Overwrote pending register: R42 in 'AssignReg'

                              -- DECOMPILER ERROR at PC723: Overwrote pending register: R43 in 'AssignReg'

                              if (l_0_84 and l_0_84) or l_0_84 then
                                l_0_84(l_0_85, l_0_86)
                              end
                              -- DECOMPILER ERROR at PC725: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC728: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC733: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC734: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC735: Overwrote pending register: R42 in 'AssignReg'

                              -- DECOMPILER ERROR at PC736: Overwrote pending register: R43 in 'AssignReg'

                              if (l_0_84 and l_0_84) or l_0_5 >= 150 then
                                l_0_84(l_0_85, l_0_86)
                              end
                              -- DECOMPILER ERROR at PC738: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC739: Overwrote pending register: R41 in 'AssignReg'

                              -- DECOMPILER ERROR at PC740: Overwrote pending register: R42 in 'AssignReg'

                              -- DECOMPILER ERROR at PC745: Overwrote pending register: R43 in 'AssignReg'

                              -- DECOMPILER ERROR at PC746: Overwrote pending register: R44 in 'AssignReg'

                              if not l_0_82 and not l_0_83 then
                                do
                                  l_0_84(l_0_85, l_0_86, ("program files").RelatedStringBMReport)
                                  -- DECOMPILER ERROR at PC749: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC750: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC751: Overwrote pending register: R42 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC752: Overwrote pending register: R43 in 'AssignReg'

                                  l_0_84(l_0_85, l_0_86, bm.RelatedStringBMReport)
                                  -- DECOMPILER ERROR at PC756: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC757: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC758: Overwrote pending register: R42 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC759: Overwrote pending register: R43 in 'AssignReg'

                                  l_0_84(l_0_85, l_0_86, bm.RelatedStringBMReport)
                                  -- DECOMPILER ERROR at PC765: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC766: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC767: Overwrote pending register: R42 in 'AssignReg'

                                  l_0_84(l_0_85)
                                  -- DECOMPILER ERROR at PC769: Overwrote pending register: R41 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC770: Overwrote pending register: R41 in 'AssignReg'

                                  do return l_0_84 end
                                  -- DECOMPILER ERROR at PC772: freeLocal<0 in 'ReleaseLocals'

                                  do return mp.CLEAN end
                                  -- WARNING: undefined locals caused missing assignments!
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

