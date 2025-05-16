-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\175b3e77091f7\0x00000e74_luac 

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
    local l_0_12, l_0_13 = pcall(MpCommon.RollingQueueQueryKeyRegex, "RQ_RecentExecDropped", l_0_0)
    if l_0_12 and l_0_13 then
      l_0_4.FileDropperInfo = safeJsonSerialize(l_0_13)
      l_0_7 = true
    else
      l_0_4.potentiallyOldDll = true
    end
    local l_0_14 = l_0_2:match("([^\\]+)$")
    local l_0_15 = (string.gsub)(l_0_0, "%d+", "0")
    local l_0_16 = (string.gsub)(l_0_5, "%d+", "0")
    local l_0_17 = l_0_14 .. "|" .. l_0_16 .. "|" .. l_0_15
    local l_0_18, l_0_19, l_0_20 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_17, 2, "MarkerRecord_" .. l_0_14)
    if l_0_18 then
      local l_0_21 = (MpCommon.GetOriginalFileName)(l_0_2)
      do
        do
          if not l_0_21 then
            local l_0_22 = (sysio.GetPEVersionInfo)(l_0_2)
            if l_0_22 and l_0_22.OriginalFilename then
              l_0_21 = l_0_22.OriginalFilename
              ;
              (MpCommon.SetOriginalFileName)(l_0_2, l_0_21)
            end
          end
          if l_0_21 then
            l_0_17 = l_0_21 .. "|" .. l_0_16 .. "|" .. l_0_15
            l_0_18 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_17, 2, "MarkerRecord_" .. l_0_14)
          end
          ;
          (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_20), bm.RelatedStringBMReport)
          l_0_4.AppName = l_0_14
          l_0_4.Dll_FileSize = (sysio.GetFileSize)(l_0_0) or 0
          l_0_4.Key = l_0_17
          local l_0_23 = "Appomaly_LoadedDlls_Size"
          local l_0_24 = 31536000
          local l_0_25 = 150
          local l_0_26 = l_0_14 .. l_0_5
          l_0_4.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_23, l_0_26) or -1
          if l_0_4.Dll_PrevFileSize == -1 and l_0_19 then
            AppendToRollingQueue(l_0_23, l_0_26, l_0_4.Dll_FileSize, l_0_24, l_0_25)
          else
            if l_0_4.Dll_PrevFileSize == -1 and not l_0_19 then
              l_0_4.DLLLoadAfterTraining = true
            else
              l_0_4.Dll_PrevFileSize = tonumber(l_0_4.Dll_PrevFileSize)
              if l_0_4.Dll_PrevFileSize * 2 < l_0_4.Dll_FileSize or l_0_4.Dll_FileSize < l_0_4.Dll_PrevFileSize / 2 then
                l_0_4.DllFileSizeAnomalous = true
              end
            end
          end
          l_0_4.inTraining = l_0_19
          if not l_0_18 and not l_0_19 and not l_0_4.DllFileSizeAnomalous then
            return mp.CLEAN
          end
          if l_0_4.Dll_PrevFileSize == l_0_4.Dll_FileSize then
            return mp.CLEAN
          end
          local l_0_27 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_5)
          -- DECOMPILER ERROR at PC301: Unhandled construct in 'MakeBoolean' P1

          if l_0_27 and l_0_27 ~= "NONE" then
            l_0_4.POTENTIAL_SIDE_LOADING = l_0_27
            l_0_7 = true
          end
          do
            local l_0_28 = "NONE"
            if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_5) then
              l_0_28 = "System32"
              if not l_0_19 then
                l_0_7 = true
              end
              l_0_4.POTENTIAL_SIDE_LOADING = "System32"
            else
              if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_5) then
                l_0_28 = "SysWOW64"
                if not l_0_19 then
                  l_0_7 = true
                end
                l_0_4.POTENTIAL_SIDE_LOADING = "SysWOW64"
              end
            end
            AppendToRollingQueue("SYSTEM_DLLs", l_0_5, l_0_28, 31104000, 5000)
            local l_0_29, l_0_30 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_1 .. "\\" .. l_0_5)
            if l_0_29 and l_0_30 then
              for l_0_34,l_0_35 in ipairs(l_0_30) do
                if (string.find)(l_0_35.value, "FileAttributes", 1, true) or (string.find)(l_0_35.value, "UnsignedFile", 1, true) then
                  l_0_4.FileDroppedRecently = true
                  l_0_4.FileInfo = l_0_30
                  l_0_7 = true
                end
              end
            end
            do
              if l_0_7 then
                local l_0_36, l_0_37 = safeJsonSerialize(l_0_4, 100, nil, true)
                local l_0_38 = bm.add_related_string
                local l_0_39 = "Additional_Info"
                do
                  l_0_38(l_0_39, l_0_36 or l_0_37 or "", bm.RelatedStringBMReport)
                  l_0_38 = bm
                  l_0_38 = l_0_38.add_related_string
                  l_0_39 = "Anomaly_LoadedDlls_TblInfo"
                  l_0_38(l_0_39, safeJsonSerialize(l_0_20), bm.RelatedStringBMReport)
                  l_0_38 = bm
                  l_0_38 = l_0_38.add_related_file
                  l_0_39 = l_0_0
                  l_0_38(l_0_39)
                  l_0_38 = mp
                  l_0_38 = l_0_38.INFECTED
                  do return l_0_38 end
                  -- DECOMPILER ERROR at PC414: freeLocal<0 in 'ReleaseLocals'

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

