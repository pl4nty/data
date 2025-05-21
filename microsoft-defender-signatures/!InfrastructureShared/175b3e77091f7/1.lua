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
      local l_0_12 = l_0_1 .. "\\" .. l_0_5
      l_0_12 = (string.gsub)(l_0_12, "\\", "\\\\")
      l_0_12 = l_0_12:gsub("([%^%$%(%)%.%[%]%*%+%-%?])", "\\%1")
      local l_0_13, l_0_14 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_12)
      if l_0_13 and l_0_14 then
        l_0_4.FileDropperInfo = safeJsonSerialize(l_0_14)
        l_0_4.FileDroppedRecently_LongTermStrg = true
        l_0_7 = true
      else
        l_0_4.potentiallyOldDll = true
      end
      local l_0_15 = l_0_2:match("([^\\]+)$")
      local l_0_16 = (string.gsub)(l_0_0, "%d+", "0")
      local l_0_17 = (string.gsub)(l_0_5, "%d+", "0")
      local l_0_18 = l_0_15 .. "|" .. l_0_17 .. "|" .. l_0_16
      local l_0_19, l_0_20, l_0_21 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_18, 2, "MarkerRecord_" .. l_0_15)
      if l_0_19 then
        local l_0_22 = (MpCommon.GetOriginalFileName)(l_0_2)
        do
          do
            if not l_0_22 then
              local l_0_23 = (sysio.GetPEVersionInfo)(l_0_2)
              if l_0_23 and l_0_23.OriginalFilename then
                l_0_22 = l_0_23.OriginalFilename
                ;
                (MpCommon.SetOriginalFileName)(l_0_2, l_0_22)
              end
            end
            if l_0_22 then
              l_0_18 = l_0_22 .. "|" .. l_0_17 .. "|" .. l_0_16
              l_0_19 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_18, 2, "MarkerRecord_" .. l_0_15)
            end
            l_0_4.AppName = l_0_15
            l_0_4.Dll_FileSize = (sysio.GetFileSize)(l_0_0) or 0
            l_0_4.Key = l_0_18
            local l_0_24 = "Appomaly_LoadedDlls_Size"
            local l_0_25 = 31536000
            local l_0_26 = 1000
            local l_0_27 = l_0_15 .. l_0_5
            l_0_4.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_24, l_0_27) or -1
            if (l_0_4.Dll_PrevFileSize == -1 or l_0_4.Dll_PrevFileSize == 0) and l_0_4.Dll_FileSize > 0 then
              AppendToRollingQueue(l_0_24, l_0_27, l_0_4.Dll_FileSize, l_0_25, l_0_26)
            else
              l_0_4.Dll_PrevFileSize = tonumber(l_0_4.Dll_PrevFileSize)
              if l_0_4.Dll_PrevFileSize * 2 < l_0_4.Dll_FileSize or l_0_4.Dll_FileSize < l_0_4.Dll_PrevFileSize / 2 then
                l_0_4.DllFileSizeAnomalous = true
              end
            end
            if l_0_4.Dll_PrevFileSize == -1 and not l_0_20 then
              l_0_4.DLLLoadAfterTraining = true
            end
            l_0_4.inTraining = l_0_20
            if not l_0_19 and not l_0_20 and not l_0_4.DllFileSizeAnomalous then
              return mp.CLEAN
            end
            if l_0_4.Dll_PrevFileSize == l_0_4.Dll_FileSize then
              return mp.CLEAN
            end
            if l_0_19 and not l_0_20 then
              l_0_4.Dll_PathNew = true
            end
            local l_0_28 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_5)
            -- DECOMPILER ERROR at PC323: Unhandled construct in 'MakeBoolean' P1

            if l_0_28 and l_0_28 ~= "NONE" then
              l_0_4.POTENTIAL_SIDE_LOADING = l_0_28
              l_0_7 = true
            end
            do
              local l_0_29 = "NONE"
              if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_5) then
                l_0_29 = "System32"
                l_0_4.POTENTIAL_SIDE_LOADING = "System32"
              else
                if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_5) then
                  l_0_29 = "SysWOW64"
                  l_0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
                end
              end
              AppendToRollingQueue("SYSTEM_DLLs", l_0_5, l_0_29, 31104000, 1000)
              local l_0_30, l_0_31 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_12)
              if l_0_30 and l_0_31 then
                for l_0_35,l_0_36 in ipairs(l_0_31) do
                  if (string.find)(l_0_36.value, "FileAttributes", 1, true) or (string.find)(l_0_36.value, "UnsignedFile", 1, true) then
                    l_0_4.FileDroppedRecently = true
                    l_0_4.FileInfo = l_0_31
                    l_0_7 = true
                  end
                end
                if not l_0_4.FileDroppedRecently then
                  return mp.CLEAN
                end
              end
              if not l_0_30 then
                (bm.add_related_string)("Error", l_0_31, bm.RelatedStringBMReport)
              end
              if not l_0_7 then
                return mp.CLEAN
              end
              local l_0_37 = "Appomaly_LoadedDlls_Version"
              local l_0_38 = 31536000
              local l_0_39 = 1000
              local l_0_40 = l_0_15 .. l_0_5 .. l_0_4.Dll_FileSize
              l_0_4.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_37, l_0_40) or ""
              if l_0_4.Dll_VersionInfo == "" then
                do
                  if not (sysio.GetPEVersionInfo)(l_0_0) then
                    local l_0_41, l_0_42, l_0_43, l_0_44 = {}
                  end
                  -- DECOMPILER ERROR at PC437: Confused about usage of register: R33 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC442: Confused about usage of register: R33 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC447: Confused about usage of register: R33 in 'UnsetPending'

                  do
                    local l_0_45 = nil
                    l_0_4.Dll_VersionInfo = (l_0_41.OriginalFilename or "") .. "|" .. (l_0_41.CompanyName or "") .. "|" .. (l_0_41.FileDescription or "")
                    -- DECOMPILER ERROR at PC456: Confused about usage of register: R34 in 'UnsetPending'

                    AppendToRollingQueue(l_0_37, l_0_40, (l_0_41.OriginalFilename or "") .. "|" .. (l_0_41.CompanyName or "") .. "|" .. (l_0_41.FileDescription or ""), l_0_38, l_0_39)
                    if (string.find)(l_0_4.Dll_VersionInfo, "Microsoft", 1, true) then
                      return mp.CLEAN
                    end
                    local l_0_46, l_0_47 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_37, l_0_15 .. l_0_5)
                    if not l_0_47 then
                      l_0_4.Dll_PrevVersionInfo = {}
                      if l_0_4.Dll_VersionInfo ~= "||" then
                        for l_0_52,i_2 in ipairs(l_0_47) do
                          if i_2.value == l_0_4.Dll_VersionInfo then
                            return mp.CLEAN
                          end
                        end
                      end
                      do
                        if l_0_4.Dll_VersionInfo ~= "||" and l_0_4.Dll_VersionInfo == (l_0_4.Dll_PrevVersionInfo).value then
                          return mp.CLEAN
                        end
                        local l_0_53, l_0_54 = safeJsonSerialize(l_0_4, 100, nil, true)
                        local l_0_55 = bm.add_related_string
                        local l_0_56 = "Additional_Info"
                        do
                          l_0_55(l_0_56, l_0_53 or l_0_54 or "", bm.RelatedStringBMReport)
                          l_0_55 = bm
                          l_0_55 = l_0_55.add_related_string
                          l_0_56 = "Anomaly_LoadedDlls_TblInfo"
                          l_0_55(l_0_56, safeJsonSerialize(l_0_21), bm.RelatedStringBMReport)
                          l_0_55 = bm
                          l_0_55 = l_0_55.add_related_file
                          l_0_56 = l_0_0
                          l_0_55(l_0_56)
                          l_0_55 = mp
                          l_0_55 = l_0_55.INFECTED
                          do return l_0_55 end
                          -- DECOMPILER ERROR at PC544: freeLocal<0 in 'ReleaseLocals'

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

