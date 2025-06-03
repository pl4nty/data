-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\11bb38b81d545\1.luac 

-- params : ...
-- function num : 0
if (bm.GetSignatureMatchDuration)() > 100000000 then
  return mp.CLEAN
end
local l_0_0 = (bm.get_imagepath)()
if not l_0_0 then
  return mp.CLEAN
end
if not (MpCommon.PathToWin32Path)(l_0_0) then
  l_0_0 = (string.lower)(l_0_0)
  local l_0_1 = (l_0_0:match("([^\\]+)$"))
  local l_0_2, l_0_3 = nil, nil
  if (this_sigattrlog[4]).matched then
    l_0_2 = (this_sigattrlog[4]).utf8p2
    if not (MpCommon.PathToWin32Path)(l_0_2) then
      l_0_2 = (string.lower)(l_0_2)
      l_0_3 = l_0_2:match("([^\\]+)$")
      if not l_0_2 or not l_0_3 then
        return mp.CLEAN
      end
      local l_0_4 = l_0_2:match("^(.*)\\")
      if not l_0_4:match("\\device\\vhdharddisk.-\\(.*)") then
        local l_0_5 = l_0_4 .. "\\" .. l_0_3
        l_0_5 = (string.gsub)(l_0_5, "\\", "\\\\")
        l_0_5 = l_0_5:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
        local l_0_6, l_0_7 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_5)
        local l_0_8 = {}
        local l_0_9 = 0
        if l_0_6 and l_0_7 then
          for l_0_13,l_0_14 in ipairs(l_0_7) do
            if (string.find)(l_0_14.value, "UnsignedFile", 1, true) then
              l_0_9 = l_0_9 + 50
              l_0_8.FileDroppedRecently = true
              l_0_8.FileInfo = l_0_7
              local l_0_15 = (string.match)(l_0_14.value, "Process_Img(.*)")
              if l_0_15 then
                local l_0_16 = contains
                local l_0_17 = l_0_15
                local l_0_18 = {}
                -- DECOMPILER ERROR at PC124: No list found for R18 , SetList fails

                -- DECOMPILER ERROR at PC129: Overwrote pending register: R16 in 'AssignReg'

                -- DECOMPILER ERROR at PC132: Overwrote pending register: R19 in 'AssignReg'

                if l_0_16 then
                  do
                    l_0_16, l_0_18 = l_0_16(l_0_17, l_0_18), {"program files", "WinRAR.exe", "7z.exe"}
                    -- DECOMPILER ERROR at PC139: Overwrote pending register: R9 in 'AssignReg'

                    -- DECOMPILER ERROR at PC142: Overwrote pending register: R17 in 'AssignReg'

                    if not l_0_16 or (string.find)(l_0_17, "FileAttributes", 1, true) then
                      local l_0_19 = (string.match)(l_0_14.value, "%[(.*)%]")
                      for l_0_23 in (string.gmatch)(l_0_19, "([^|]+)") do
                        -- DECOMPILER ERROR at PC162: Overwrote pending register: R9 in 'AssignReg'

                        -- DECOMPILER ERROR at PC165: Overwrote pending register: R9 in 'AssignReg'

                      end
                    end
                    if l_0_23 == "SLF:Aurora.A!rfn" or l_0_23 == "SLF:HighRiskHasMotW" then
                      do
                        do break end
                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC169: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
          if not l_0_8.FileDroppedRecently then
            return mp.CLEAN
          end
        else
          return mp.CLEAN
        end
        local l_0_24 = (string.gsub)(l_0_2, "%d+", "0")
        local l_0_25 = (string.gsub)(l_0_3, "%d+", "0")
        local l_0_26 = l_0_1 .. "|" .. l_0_25 .. "|" .. l_0_24
        local l_0_27, l_0_28, l_0_29 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_26, 2, "MarkerRecord_" .. l_0_1)
        if l_0_27 then
          local l_0_30 = (MpCommon.GetOriginalFileName)(l_0_0)
          do
            do
              if not l_0_30 then
                local l_0_31 = (sysio.GetPEVersionInfo)(l_0_0)
                if l_0_31 and l_0_31.OriginalFilename then
                  l_0_30 = l_0_31.OriginalFilename
                  ;
                  (MpCommon.SetOriginalFileName)(l_0_0, l_0_30)
                end
              end
              if l_0_30 then
                l_0_26 = l_0_30 .. "|" .. l_0_25 .. "|" .. l_0_24
                l_0_27 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_26, 2, "MarkerRecord_" .. l_0_1)
              end
              ;
              (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_29), bm.RelatedStringBMReport)
              l_0_8.AppName = l_0_1
              l_0_8.Dll_Path = l_0_2
              l_0_8.Key = l_0_26
              l_0_8.Dll_FileSize = (sysio.GetFileSize)(l_0_2) or 0
              local l_0_32 = "Appomaly_LoadedDlls_Size"
              local l_0_33 = 31536000
              local l_0_34 = 1000
              local l_0_35 = l_0_1 .. l_0_3
              l_0_8.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_32, l_0_35) or -1
              if (l_0_8.Dll_PrevFileSize == -1 or l_0_8.Dll_PrevFileSize == 0) and l_0_8.Dll_FileSize > 0 then
                AppendToRollingQueue(l_0_32, l_0_35, l_0_8.Dll_FileSize, l_0_33, l_0_34)
              else
                if l_0_8.Dll_FileSize > 0 then
                  l_0_8.Dll_PrevFileSize = tonumber(l_0_8.Dll_PrevFileSize)
                  if l_0_8.Dll_PrevFileSize * 2 < l_0_8.Dll_FileSize or l_0_8.Dll_FileSize < l_0_8.Dll_PrevFileSize / 2 then
                    l_0_8.DllFileSizeAnomalous = true
                  end
                end
              end
              if l_0_8.Dll_PrevFileSize == -1 and not l_0_28 then
                l_0_8.DLLLoadAfterTraining = true
              end
              if not l_0_27 and not l_0_28 and not l_0_8.DllFileSizeAnomalous then
                return mp.CLEAN
              end
              if l_0_8.Dll_PrevFileSize == l_0_8.Dll_FileSize then
                return mp.CLEAN
              end
              local l_0_36 = "Appomaly_LoadedDlls_Version"
              local l_0_37 = 31536000
              local l_0_38 = 1000
              local l_0_39 = l_0_1 .. l_0_3 .. l_0_8.Dll_FileSize
              l_0_8.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_36, l_0_39) or ""
              if l_0_8.Dll_VersionInfo == "" then
                do
                  if not (sysio.GetPEVersionInfo)(l_0_2) then
                    local l_0_40, l_0_41, l_0_42, l_0_43 = {}
                  end
                  -- DECOMPILER ERROR at PC366: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC371: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC376: Confused about usage of register: R24 in 'UnsetPending'

                  do
                    local l_0_44 = nil
                    l_0_8.Dll_VersionInfo = (l_0_40.OriginalFilename or "") .. "|" .. (l_0_40.CompanyName or "") .. "|" .. (l_0_40.FileDescription or "")
                    -- DECOMPILER ERROR at PC385: Confused about usage of register: R25 in 'UnsetPending'

                    AppendToRollingQueue(l_0_36, l_0_39, (l_0_40.OriginalFilename or "") .. "|" .. (l_0_40.CompanyName or "") .. "|" .. (l_0_40.FileDescription or ""), l_0_37, l_0_38)
                    if (string.find)(l_0_8.Dll_VersionInfo, "Microsoft", 1, true) then
                      return mp.CLEAN
                    end
                    local l_0_45 = function(l_1_0, l_1_1)
  -- function num : 0_0
  l_1_0 = (string.lower)(l_1_0)
  l_1_1 = (string.lower)(l_1_1)
  if (string.match)(l_1_0, "(.-)|(.-)|(.*)") == (string.match)(l_1_1, "(.-)|(.-)|(.*)") or l_1_0 == l_1_1 or "(.-)|(.-)|(.*)" == "(.-)|(.-)|(.*)" then
    return true
  end
  return false
end

                    local l_0_46, l_0_47 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_36, l_0_1 .. l_0_3)
                    if not l_0_47 then
                      l_0_8.Dll_PrevVersionInfo = {}
                      if l_0_8.Dll_VersionInfo ~= "||" and l_0_8.Dll_VersionInfo == (l_0_8.Dll_PrevVersionInfo).value then
                        return mp.CLEAN
                      end
                      if l_0_8.Dll_VersionInfo ~= "||" then
                        for l_0_52,i_2 in ipairs(l_0_47) do
                          if l_0_45(i_2.value, l_0_8.Dll_VersionInfo) then
                            return mp.CLEAN
                          end
                        end
                      end
                      do
                        local l_0_53 = l_0_2:match("^(.*)\\")
                        local l_0_54 = l_0_0:match("^(.*)\\")
                        if l_0_53 == l_0_54 then
                          l_0_8.SameDirectory = true
                          -- DECOMPILER ERROR at PC452: Overwrote pending register: R9 in 'AssignReg'

                        end
                        local l_0_55, l_0_56 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3)
                        -- DECOMPILER ERROR at PC461: Unhandled construct in 'MakeBoolean' P1

                        if l_0_56 and l_0_56 ~= "NONE" then
                          l_0_8.POTENTIAL_SIDE_LOADING = l_0_56
                          -- DECOMPILER ERROR at PC462: Overwrote pending register: R9 in 'AssignReg'

                        end
                        do
                          local l_0_57 = "NONE"
                          if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_3) then
                            l_0_57 = "System32"
                            l_0_8.POTENTIAL_SIDE_LOADING = "System32"
                            -- DECOMPILER ERROR at PC475: Overwrote pending register: R9 in 'AssignReg'

                          else
                            if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_3) then
                              l_0_57 = "SysWOW64"
                              l_0_8.POTENTIAL_SIDE_LOADING = "SysWOW64"
                              -- DECOMPILER ERROR at PC487: Overwrote pending register: R9 in 'AssignReg'

                            end
                          end
                          AppendToRollingQueue("SYSTEM_DLLs", l_0_3, l_0_57, 31104000, 1000)
                          -- DECOMPILER ERROR at PC504: Overwrote pending register: R9 in 'AssignReg'

                          if not l_0_28 then
                            if (MpCommon.StringRegExpSearch)("(desktop|download|onedrive|document|picture)", l_0_2) then
                              local l_0_58 = contains
                              local l_0_59 = l_0_2
                              local l_0_60 = {}
                              -- DECOMPILER ERROR at PC510: No list found for R33 , SetList fails

                              -- DECOMPILER ERROR at PC514: Overwrote pending register: R9 in 'AssignReg'

                              -- DECOMPILER ERROR at PC515: Overwrote pending register: R31 in 'AssignReg'

                              -- DECOMPILER ERROR at PC518: Overwrote pending register: R34 in 'AssignReg'

                              if (not l_0_58 or l_0_58) and l_0_59 then
                                return mp.CLEAN
                              end
                              -- DECOMPILER ERROR at PC529: Overwrote pending register: R9 in 'AssignReg'

                              -- DECOMPILER ERROR at PC532: Overwrote pending register: R9 in 'AssignReg'

                              if ((l_0_58 and not l_0_60) or not l_0_8.Known_VulnerableDll) and not l_0_8.POTENTIAL_SIDE_LOADING then
                                return mp.CLEAN
                              end
                              -- DECOMPILER ERROR at PC545: Overwrote pending register: R35 in 'AssignReg'

                              local l_0_61, l_0_62 = safeJsonSerialize("appdata", 150, nil, true)
                              if (l_0_8.Known_VulnerableDll and l_0_8.Vulnerable_App) or l_0_8.POTENTIAL_SIDE_LOADING then
                                (bm.trigger_sig)("PotentialSideLoading_D_Evaluator", l_0_61)
                              end
                              local l_0_63 = bm.add_related_string
                              local l_0_64 = "Additional_Info"
                              do
                                do
                                  l_0_63(l_0_64, l_0_61 or l_0_62 or "", bm.RelatedStringBMReport)
                                  l_0_63 = bm
                                  l_0_63 = l_0_63.add_related_string
                                  l_0_64 = "Score"
                                  l_0_63(l_0_64, l_0_9, bm.RelatedStringBMReport)
                                  l_0_63 = bm
                                  l_0_63 = l_0_63.add_related_file
                                  l_0_64 = l_0_2
                                  l_0_63(l_0_64)
                                  l_0_63 = mp
                                  l_0_63 = l_0_63.INFECTED
                                  do return l_0_63 end
                                  -- DECOMPILER ERROR at PC589: Overwrote pending register: R31 in 'AssignReg'

                                  do return l_0_58.CLEAN end
                                  -- DECOMPILER ERROR at PC592: freeLocal<0 in 'ReleaseLocals'

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

