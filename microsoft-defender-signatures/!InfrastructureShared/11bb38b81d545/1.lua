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
      local l_0_6, l_0_7 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_5)
      local l_0_8 = {}
      if l_0_6 and l_0_7 then
        for l_0_12,l_0_13 in ipairs(l_0_7) do
          if (string.find)(l_0_13.value, "FileAttributes", 1, true) or (string.find)(l_0_13.value, "UnsignedFile", 1, true) then
            l_0_8.FileDroppedRecently = true
            l_0_8.FileInfo = l_0_7
            break
          end
        end
        do
          if not l_0_8.FileDroppedRecently then
            return mp.CLEAN
          end
          local l_0_14 = (string.gsub)(l_0_2, "%d+", "0")
          local l_0_15 = (string.gsub)(l_0_3, "%d+", "0")
          local l_0_16 = l_0_1 .. "|" .. l_0_15 .. "|" .. l_0_14
          local l_0_17, l_0_18, l_0_19 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_16, 2, "MarkerRecord_" .. l_0_1)
          if l_0_17 then
            local l_0_20 = (MpCommon.GetOriginalFileName)(l_0_0)
            do
              do
                if not l_0_20 then
                  local l_0_21 = (sysio.GetPEVersionInfo)(l_0_0)
                  if l_0_21 and l_0_21.OriginalFilename then
                    l_0_20 = l_0_21.OriginalFilename
                    ;
                    (MpCommon.SetOriginalFileName)(l_0_0, l_0_20)
                  end
                end
                if l_0_20 then
                  l_0_16 = l_0_20 .. "|" .. l_0_15 .. "|" .. l_0_14
                  l_0_17 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_16, 2, "MarkerRecord_" .. l_0_1)
                end
                ;
                (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_19), bm.RelatedStringBMReport)
                l_0_8.AppName = l_0_1
                l_0_8.Dll_Path = l_0_2
                l_0_8.Key = l_0_16
                l_0_8.Dll_FileSize = (sysio.GetFileSize)(l_0_2) or 0
                local l_0_22 = "Appomaly_LoadedDlls_Size"
                local l_0_23 = 31536000
                local l_0_24 = 1000
                local l_0_25 = l_0_1 .. l_0_3
                l_0_8.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_22, l_0_25) or -1
                if (l_0_8.Dll_PrevFileSize == -1 or l_0_8.Dll_PrevFileSize == 0) and l_0_8.Dll_FileSize > 0 then
                  AppendToRollingQueue(l_0_22, l_0_25, l_0_8.Dll_FileSize, l_0_23, l_0_24)
                else
                  l_0_8.Dll_PrevFileSize = tonumber(l_0_8.Dll_PrevFileSize)
                  if l_0_8.Dll_PrevFileSize * 2 < l_0_8.Dll_FileSize or l_0_8.Dll_FileSize < l_0_8.Dll_PrevFileSize / 2 then
                    l_0_8.DllFileSizeAnomalous = true
                  end
                end
                if l_0_8.Dll_PrevFileSize == -1 and not l_0_18 then
                  l_0_8.DLLLoadAfterTraining = true
                end
                if not l_0_17 and not l_0_18 and not l_0_8.DllFileSizeAnomalous then
                  return mp.CLEAN
                end
                if l_0_8.Dll_PrevFileSize == l_0_8.Dll_FileSize then
                  return mp.CLEAN
                end
                local l_0_26 = "Appomaly_LoadedDlls_Version"
                local l_0_27 = 31536000
                local l_0_28 = 1000
                local l_0_29 = l_0_1 .. l_0_3 .. l_0_8.Dll_FileSize
                l_0_8.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_26, l_0_29) or ""
                if l_0_8.Dll_VersionInfo == "" then
                  do
                    if not (sysio.GetPEVersionInfo)(l_0_2) then
                      local l_0_30, l_0_31, l_0_32, l_0_33 = {}
                    end
                    -- DECOMPILER ERROR at PC305: Confused about usage of register: R23 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC310: Confused about usage of register: R23 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC315: Confused about usage of register: R23 in 'UnsetPending'

                    do
                      local l_0_34 = nil
                      l_0_8.Dll_VersionInfo = (l_0_30.OriginalFilename or "") .. "|" .. (l_0_30.CompanyName or "") .. "|" .. (l_0_30.FileDescription or "")
                      -- DECOMPILER ERROR at PC324: Confused about usage of register: R24 in 'UnsetPending'

                      AppendToRollingQueue(l_0_26, l_0_29, (l_0_30.OriginalFilename or "") .. "|" .. (l_0_30.CompanyName or "") .. "|" .. (l_0_30.FileDescription or ""), l_0_27, l_0_28)
                      if (string.find)(l_0_8.Dll_VersionInfo, "Microsoft", 1, true) then
                        return mp.CLEAN
                      end
                      local l_0_35, l_0_36 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_26, l_0_1 .. l_0_3)
                      if not l_0_36 then
                        l_0_8.Dll_PrevVersionInfo = {}
                        if l_0_8.Dll_VersionInfo ~= "||" and l_0_8.Dll_VersionInfo == (l_0_8.Dll_PrevVersionInfo).value then
                          return mp.CLEAN
                        end
                        if l_0_8.Dll_VersionInfo ~= "||" then
                          for l_0_41,i_2 in ipairs(l_0_36) do
                            if i_2.value == l_0_8.Dll_VersionInfo then
                              return mp.CLEAN
                            end
                          end
                        end
                        do
                          local l_0_42 = l_0_2:match("^(.*)\\")
                          local l_0_43 = l_0_0:match("^(.*)\\")
                          if l_0_42 == l_0_43 then
                            (bm.trigger_sig)("PotentialSideLoadingEvaluator", l_0_0 .. "|" .. l_0_2)
                          end
                          local l_0_44 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3)
                          -- DECOMPILER ERROR at PC403: Unhandled construct in 'MakeBoolean' P1

                          if l_0_44 and l_0_44 ~= "NONE" then
                            l_0_8.POTENTIAL_SIDE_LOADING = l_0_44
                          end
                          do
                            local l_0_45 = "NONE"
                            if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_3) then
                              l_0_45 = "System32"
                              l_0_8.POTENTIAL_SIDE_LOADING = "System32"
                            else
                              if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_3) then
                                l_0_45 = "SysWOW64"
                                l_0_8.POTENTIAL_SIDE_LOADING = "SysWOW64"
                              end
                            end
                            AppendToRollingQueue("SYSTEM_DLLs", l_0_3, l_0_45, 31104000, 1000)
                            if not l_0_18 then
                              local l_0_46, l_0_47 = safeJsonSerialize(l_0_8, 150, nil, true)
                              local l_0_48 = bm.add_related_string
                              local l_0_49 = "Additional_Info"
                              l_0_48(l_0_49, l_0_46 or l_0_47 or "", bm.RelatedStringBMReport)
                              l_0_48 = bm
                              l_0_48 = l_0_48.add_related_file
                              l_0_49 = l_0_2
                              l_0_48(l_0_49)
                              l_0_48 = mp
                              l_0_48 = l_0_48.INFECTED
                              return l_0_48
                            end
                            do
                              do
                                do return mp.CLEAN end
                                -- DECOMPILER ERROR at PC463: freeLocal<0 in 'ReleaseLocals'

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

