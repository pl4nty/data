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
      if l_0_6 and l_0_7 then
        for l_0_11,l_0_12 in ipairs(l_0_7) do
          if (string.find)(l_0_12.value, "FileAttributes", 1, true) or (string.find)(l_0_12.value, "UnsignedFile", 1, true) then
            do
              do
                local l_0_13 = {}
                l_0_13.dllPath = l_0_2
                l_0_13.FileDroppedRecently = true
                l_0_13.FileInfo = l_0_7
                ;
                (bm.trigger_sig)("PotentialSideLoading_C_Evaluator", safeJsonSerialize(l_0_13))
                do break end
                -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
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
            local l_0_22 = {}
            ;
            (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_19), bm.RelatedStringBMReport)
            l_0_22.AppName = l_0_1
            l_0_22.Dll_Path = l_0_2
            l_0_22.Key = l_0_16
            l_0_22.Dll_FileSize = (sysio.GetFileSize)(l_0_2) or 0
            local l_0_23 = "Appomaly_LoadedDlls_Size"
            local l_0_24 = 31536000
            local l_0_25 = 1000
            local l_0_26 = l_0_1 .. l_0_3
            l_0_22.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_23, l_0_26) or -1
            if (l_0_22.Dll_PrevFileSize == -1 or l_0_22.Dll_PrevFileSize == 0) and l_0_22.Dll_FileSize > 0 then
              AppendToRollingQueue(l_0_23, l_0_26, l_0_22.Dll_FileSize, l_0_24, l_0_25)
            else
              l_0_22.Dll_PrevFileSize = tonumber(l_0_22.Dll_PrevFileSize)
              if l_0_22.Dll_PrevFileSize * 2 < l_0_22.Dll_FileSize or l_0_22.Dll_FileSize < l_0_22.Dll_PrevFileSize / 2 then
                l_0_22.DllFileSizeAnomalous = true
              end
            end
            if l_0_22.Dll_PrevFileSize == -1 and not l_0_18 then
              l_0_22.DLLLoadAfterTraining = true
            end
            if not l_0_17 and not l_0_18 and not l_0_22.DllFileSizeAnomalous then
              return mp.CLEAN
            end
            if l_0_22.Dll_PrevFileSize == l_0_22.Dll_FileSize then
              return mp.CLEAN
            end
            local l_0_27 = "Appomaly_LoadedDlls_Version"
            local l_0_28 = 31536000
            local l_0_29 = 1000
            local l_0_30 = l_0_1 .. l_0_3 .. l_0_22.Dll_FileSize
            l_0_22.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_27, l_0_30) or ""
            if l_0_22.Dll_VersionInfo == "" then
              do
                if not (sysio.GetPEVersionInfo)(l_0_2) then
                  local l_0_31, l_0_32, l_0_33, l_0_34 = {}
                end
                -- DECOMPILER ERROR at PC308: Confused about usage of register: R23 in 'UnsetPending'

                -- DECOMPILER ERROR at PC313: Confused about usage of register: R23 in 'UnsetPending'

                -- DECOMPILER ERROR at PC318: Confused about usage of register: R23 in 'UnsetPending'

                do
                  local l_0_35 = nil
                  l_0_22.Dll_VersionInfo = (l_0_31.OriginalFilename or "") .. "|" .. (l_0_31.CompanyName or "") .. "|" .. (l_0_31.FileDescription or "")
                  -- DECOMPILER ERROR at PC327: Confused about usage of register: R24 in 'UnsetPending'

                  AppendToRollingQueue(l_0_27, l_0_30, (l_0_31.OriginalFilename or "") .. "|" .. (l_0_31.CompanyName or "") .. "|" .. (l_0_31.FileDescription or ""), l_0_28, l_0_29)
                  if (string.find)(l_0_22.Dll_VersionInfo, "Microsoft", 1, true) then
                    return mp.CLEAN
                  end
                  local l_0_36, l_0_37 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_27, l_0_1 .. l_0_3)
                  if not l_0_37 then
                    l_0_22.Dll_PrevVersionInfo = {}
                    local l_0_39 = l_0_2:match("^(.*)\\")
                    if l_0_39 == l_0_0:match("^(.*)\\") then
                      (bm.trigger_sig)("PotentialSideLoadingEvaluator", l_0_0 .. "|" .. l_0_2)
                    end
                    local l_0_40 = nil
                    -- DECOMPILER ERROR at PC379: Unhandled construct in 'MakeBoolean' P1

                    if IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3) and IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3) ~= "NONE" then
                      l_0_22.POTENTIAL_SIDE_LOADING = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3)
                    end
                    local l_0_41 = nil
                    -- DECOMPILER ERROR at PC390: Overwrote pending register: R28 in 'AssignReg'

                    -- DECOMPILER ERROR at PC401: Overwrote pending register: R28 in 'AssignReg'

                    if not (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_3) or (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_3) then
                      do
                        AppendToRollingQueue("SYSTEM_DLLs", l_0_3, "NONE", 31104000, 5000)
                        if not l_0_18 then
                          local l_0_42, l_0_43 = , safeJsonSerialize(l_0_22, 150, nil, true)
                          local l_0_44 = nil
                          local l_0_45 = bm.add_related_string
                          l_0_45("Additional_Info", l_0_43 or l_0_44 or "", bm.RelatedStringBMReport)
                          l_0_45 = bm
                          l_0_45 = l_0_45.add_related_file
                          l_0_45(l_0_2)
                          l_0_45 = mp
                          l_0_45 = l_0_45.INFECTED
                          return l_0_45
                        end
                        do
                          do
                            do return mp.CLEAN end
                            -- DECOMPILER ERROR at PC439: freeLocal<0 in 'ReleaseLocals'

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

