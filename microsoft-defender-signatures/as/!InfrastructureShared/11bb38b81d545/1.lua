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
          do
            if l_0_7.value then
              local l_0_10 = {}
              -- DECOMPILER ERROR at PC102: No list found for R10 , SetList fails

            end
            -- DECOMPILER ERROR at PC105: Overwrote pending register: R11 in 'AssignReg'

            for l_0_14,l_0_15 in ipairs(l_0_7) do
              if (string.find)(l_0_15.value, "UnsignedFile", 1, true) then
                l_0_9 = l_0_9 + 50
                l_0_8.FileDroppedRecently = true
                l_0_8.FileInfo = l_0_7
                local l_0_16 = (string.match)(l_0_15.value, "Process_Img(.*)")
                if l_0_16 then
                  local l_0_17 = contains
                  local l_0_18 = l_0_16
                  local l_0_19 = {}
                  -- DECOMPILER ERROR at PC131: No list found for R18 , SetList fails

                  -- DECOMPILER ERROR at PC136: Overwrote pending register: R16 in 'AssignReg'

                  -- DECOMPILER ERROR at PC139: Overwrote pending register: R19 in 'AssignReg'

                  if l_0_17 then
                    do
                      l_0_17, l_0_19 = l_0_17(l_0_18, l_0_19), {"program files", "WinRAR.exe", "7z.exe"}
                      -- DECOMPILER ERROR at PC146: Overwrote pending register: R9 in 'AssignReg'

                      -- DECOMPILER ERROR at PC149: Overwrote pending register: R17 in 'AssignReg'

                      if not l_0_17 or (string.find)(l_0_18, "FileAttributes", 1, true) then
                        local l_0_20 = (string.match)(l_0_15.value, "%[(.*)%]")
                        for l_0_24 in (string.gmatch)(l_0_20, "([^|]+)") do
                          -- DECOMPILER ERROR at PC169: Overwrote pending register: R9 in 'AssignReg'

                          -- DECOMPILER ERROR at PC172: Overwrote pending register: R9 in 'AssignReg'

                        end
                      end
                      if l_0_24 == "SLF:Aurora.A!rfn" or l_0_24 == "SLF:HighRiskHasMotW" then
                        do
                          do break end
                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out DO_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_THEN_STMT

                          -- DECOMPILER ERROR at PC176: LeaveBlock: unexpected jumping out IF_STMT

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
            do return mp.CLEAN end
            local l_0_25 = (string.gsub)(l_0_2, "%d+", "0")
            local l_0_26 = (string.gsub)(l_0_3, "%d+", "0")
            local l_0_27 = l_0_1 .. "|" .. l_0_26 .. "|" .. l_0_25
            local l_0_28, l_0_29, l_0_30 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_27, 2, "MarkerRecord_" .. l_0_1)
            if l_0_28 then
              local l_0_31 = (MpCommon.GetOriginalFileName)(l_0_0)
              do
                do
                  if not l_0_31 then
                    local l_0_32 = (sysio.GetPEVersionInfo)(l_0_0)
                    if l_0_32 and l_0_32.OriginalFilename then
                      l_0_31 = l_0_32.OriginalFilename
                      ;
                      (MpCommon.SetOriginalFileName)(l_0_0, l_0_31)
                    end
                  end
                  if l_0_31 then
                    l_0_27 = l_0_31 .. "|" .. l_0_26 .. "|" .. l_0_25
                    l_0_28 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_27, 2, "MarkerRecord_" .. l_0_1)
                  end
                  ;
                  (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_30), bm.RelatedStringBMReport)
                  l_0_8.AppName = l_0_1
                  l_0_8.Dll_Path = l_0_2
                  l_0_8.Key = l_0_27
                  l_0_8.Dll_FileSize = (sysio.GetFileSize)(l_0_2) or 0
                  local l_0_33 = "Appomaly_LoadedDlls_Size"
                  local l_0_34 = 31536000
                  local l_0_35 = 1000
                  local l_0_36 = l_0_1 .. l_0_3
                  l_0_8.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_33, l_0_36) or -1
                  if (l_0_8.Dll_PrevFileSize == -1 or l_0_8.Dll_PrevFileSize == 0) and l_0_8.Dll_FileSize > 0 then
                    AppendToRollingQueue(l_0_33, l_0_36, l_0_8.Dll_FileSize, l_0_34, l_0_35)
                  else
                    if l_0_8.Dll_FileSize > 0 then
                      l_0_8.Dll_PrevFileSize = tonumber(l_0_8.Dll_PrevFileSize)
                      if l_0_8.Dll_PrevFileSize * 2 < l_0_8.Dll_FileSize or l_0_8.Dll_FileSize < l_0_8.Dll_PrevFileSize / 2 then
                        l_0_8.DllFileSizeAnomalous = true
                      end
                    end
                  end
                  if l_0_8.Dll_PrevFileSize == -1 and not l_0_29 then
                    l_0_8.DLLLoadAfterTraining = true
                  end
                  if not l_0_28 and not l_0_29 and not l_0_8.DllFileSizeAnomalous then
                    return mp.CLEAN
                  end
                  if l_0_8.Dll_PrevFileSize == l_0_8.Dll_FileSize then
                    return mp.CLEAN
                  end
                  local l_0_37 = "Appomaly_LoadedDlls_Version"
                  local l_0_38 = 31536000
                  local l_0_39 = 1000
                  local l_0_40 = l_0_1 .. l_0_3 .. l_0_8.Dll_FileSize
                  l_0_8.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_37, l_0_40) or ""
                  if l_0_8.Dll_VersionInfo == "" then
                    do
                      if not (sysio.GetPEVersionInfo)(l_0_2) then
                        local l_0_41, l_0_42, l_0_43, l_0_44 = {}
                      end
                      -- DECOMPILER ERROR at PC373: Confused about usage of register: R24 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC378: Confused about usage of register: R24 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC383: Confused about usage of register: R24 in 'UnsetPending'

                      do
                        local l_0_45 = nil
                        l_0_8.Dll_VersionInfo = (l_0_41.OriginalFilename or "") .. "|" .. (l_0_41.CompanyName or "") .. "|" .. (l_0_41.FileDescription or "")
                        -- DECOMPILER ERROR at PC392: Confused about usage of register: R25 in 'UnsetPending'

                        AppendToRollingQueue(l_0_37, l_0_40, (l_0_41.OriginalFilename or "") .. "|" .. (l_0_41.CompanyName or "") .. "|" .. (l_0_41.FileDescription or ""), l_0_38, l_0_39)
                        if (string.find)(l_0_8.Dll_VersionInfo, "Microsoft", 1, true) then
                          return mp.CLEAN
                        end
                        local l_0_46 = function(l_1_0, l_1_1)
  -- function num : 0_0
  l_1_0 = (string.lower)(l_1_0)
  l_1_1 = (string.lower)(l_1_1)
  if (string.match)(l_1_0, "(.-)|(.-)|(.*)") == (string.match)(l_1_1, "(.-)|(.-)|(.*)") or l_1_0 == l_1_1 or "(.-)|(.-)|(.*)" == "(.-)|(.-)|(.*)" then
    return true
  end
  return false
end

                        local l_0_47, l_0_48 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_37, l_0_1 .. l_0_3)
                        if not l_0_48 then
                          l_0_8.Dll_PrevVersionInfo = {}
                          if l_0_8.Dll_VersionInfo ~= "||" and l_0_8.Dll_VersionInfo == (l_0_8.Dll_PrevVersionInfo).value then
                            return mp.CLEAN
                          end
                          if l_0_8.Dll_VersionInfo ~= "||" then
                            for l_0_53,i_2 in ipairs(l_0_48) do
                              if l_0_46(i_2.value, l_0_8.Dll_VersionInfo) then
                                return mp.CLEAN
                              end
                            end
                          end
                          do
                            local l_0_54 = l_0_2:match("^(.*)\\")
                            local l_0_55 = l_0_0:match("^(.*)\\")
                            if l_0_54 == l_0_55 then
                              l_0_8.SameDirectory = true
                              -- DECOMPILER ERROR at PC459: Overwrote pending register: R9 in 'AssignReg'

                            end
                            local l_0_56, l_0_57 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3)
                            -- DECOMPILER ERROR at PC468: Unhandled construct in 'MakeBoolean' P1

                            if l_0_57 and l_0_57 ~= "NONE" then
                              l_0_8.POTENTIAL_SIDE_LOADING = l_0_57
                              -- DECOMPILER ERROR at PC469: Overwrote pending register: R9 in 'AssignReg'

                            end
                            do
                              local l_0_58 = "NONE"
                              if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_3) then
                                l_0_58 = "System32"
                                l_0_8.POTENTIAL_SIDE_LOADING = "System32"
                                -- DECOMPILER ERROR at PC482: Overwrote pending register: R9 in 'AssignReg'

                              else
                                if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_3) then
                                  l_0_58 = "SysWOW64"
                                  l_0_8.POTENTIAL_SIDE_LOADING = "SysWOW64"
                                  -- DECOMPILER ERROR at PC494: Overwrote pending register: R9 in 'AssignReg'

                                end
                              end
                              AppendToRollingQueue("SYSTEM_DLLs", l_0_3, l_0_58, 31104000, 1000)
                              -- DECOMPILER ERROR at PC511: Overwrote pending register: R9 in 'AssignReg'

                              if not l_0_29 then
                                if (MpCommon.StringRegExpSearch)("(desktop|download|onedrive|document|picture)", l_0_2) then
                                  local l_0_59 = contains
                                  local l_0_60 = l_0_2
                                  local l_0_61 = {}
                                  -- DECOMPILER ERROR at PC517: No list found for R33 , SetList fails

                                  -- DECOMPILER ERROR at PC521: Overwrote pending register: R9 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC522: Overwrote pending register: R31 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC525: Overwrote pending register: R34 in 'AssignReg'

                                  if (not l_0_59 or l_0_59) and l_0_60 then
                                    return mp.CLEAN
                                  end
                                  -- DECOMPILER ERROR at PC536: Overwrote pending register: R9 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC539: Overwrote pending register: R9 in 'AssignReg'

                                  if ((l_0_59 and not l_0_61) or not l_0_8.Known_VulnerableDll) and not l_0_8.POTENTIAL_SIDE_LOADING then
                                    return mp.CLEAN
                                  end
                                  -- DECOMPILER ERROR at PC552: Overwrote pending register: R35 in 'AssignReg'

                                  local l_0_62, l_0_63 = safeJsonSerialize("appdata", 150, nil, true)
                                  if (l_0_8.Known_VulnerableDll and l_0_8.Vulnerable_App) or l_0_8.POTENTIAL_SIDE_LOADING then
                                    (bm.trigger_sig)("PotentialSideLoading_D_Evaluator", l_0_62)
                                  end
                                  local l_0_64 = bm.add_related_string
                                  local l_0_65 = "Additional_Info"
                                  do
                                    do
                                      l_0_64(l_0_65, l_0_62 or l_0_63 or "", bm.RelatedStringBMReport)
                                      l_0_64 = bm
                                      l_0_64 = l_0_64.add_related_string
                                      l_0_65 = "Score"
                                      l_0_64(l_0_65, l_0_9, bm.RelatedStringBMReport)
                                      l_0_64 = bm
                                      l_0_64 = l_0_64.add_related_file
                                      l_0_65 = l_0_2
                                      l_0_64(l_0_65)
                                      l_0_64 = mp
                                      l_0_64 = l_0_64.INFECTED
                                      do return l_0_64 end
                                      -- DECOMPILER ERROR at PC596: Overwrote pending register: R31 in 'AssignReg'

                                      do return l_0_59.CLEAN end
                                      -- DECOMPILER ERROR at PC599: freeLocal<0 in 'ReleaseLocals'

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

