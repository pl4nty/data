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
      local l_0_5, l_0_6 = pcall(MpCommon.RollingQueueQueryMultiKeyRegex, "RQ_RecentExecDropped_MultipleKey_30m", l_0_4 .. "\\" .. l_0_3)
      if l_0_5 and l_0_6 then
        for l_0_10,l_0_11 in ipairs(l_0_6) do
          if (string.find)(l_0_11.value, "FileAttributes", 1, true) or (string.find)(l_0_11.value, "UnsignedFile", 1, true) then
            do
              do
                local l_0_12 = {}
                l_0_12.dllPath = l_0_2
                l_0_12.FileDroppedRecently = true
                l_0_12.FileInfo = l_0_6
                ;
                (bm.trigger_sig)("PotentialSideLoading_C_Evaluator", safeJsonSerialize(l_0_12))
                do break end
                -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out DO_STMT

                -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_THEN_STMT

                -- DECOMPILER ERROR at PC110: LeaveBlock: unexpected jumping out IF_STMT

              end
            end
          end
        end
      end
      local l_0_13 = (string.gsub)(l_0_2, "%d+", "0")
      local l_0_14 = (string.gsub)(l_0_3, "%d+", "0")
      local l_0_15 = l_0_1 .. "|" .. l_0_14 .. "|" .. l_0_13
      local l_0_16, l_0_17, l_0_18 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_15, 2, "MarkerRecord_" .. l_0_1)
      if l_0_16 then
        local l_0_19 = (MpCommon.GetOriginalFileName)(l_0_0)
        do
          do
            if not l_0_19 then
              local l_0_20 = (sysio.GetPEVersionInfo)(l_0_0)
              if l_0_20 and l_0_20.OriginalFilename then
                l_0_19 = l_0_20.OriginalFilename
                ;
                (MpCommon.SetOriginalFileName)(l_0_0, l_0_19)
              end
            end
            if l_0_19 then
              l_0_15 = l_0_19 .. "|" .. l_0_14 .. "|" .. l_0_13
              l_0_16 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_15, 2, "MarkerRecord_" .. l_0_1)
            end
            local l_0_21 = {}
            ;
            (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_18), bm.RelatedStringBMReport)
            l_0_21.AppName = l_0_1
            l_0_21.Dll_Path = l_0_2
            l_0_21.Key = l_0_15
            l_0_21.Dll_FileSize = (sysio.GetFileSize)(l_0_2) or 0
            local l_0_22 = "Appomaly_LoadedDlls_Size"
            local l_0_23 = 31536000
            local l_0_24 = 1000
            local l_0_25 = l_0_1 .. l_0_3
            l_0_21.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_22, l_0_25) or -1
            if l_0_21.Dll_PrevFileSize == -1 and l_0_17 then
              AppendToRollingQueue(l_0_22, l_0_25, l_0_21.Dll_FileSize, l_0_23, l_0_24)
            else
              if l_0_21.Dll_PrevFileSize == -1 and not l_0_17 then
                l_0_21.DLLLoadAfterTraining = true
              else
                l_0_21.Dll_PrevFileSize = tonumber(l_0_21.Dll_PrevFileSize)
                if l_0_21.Dll_PrevFileSize * 2 < l_0_21.Dll_FileSize or l_0_21.Dll_FileSize < l_0_21.Dll_PrevFileSize / 2 then
                  l_0_21.DllFileSizeAnomalous = true
                end
              end
            end
            if not l_0_16 and not l_0_17 and not l_0_21.DllFileSizeAnomalous then
              return mp.CLEAN
            end
            if l_0_21.Dll_PrevFileSize == l_0_21.Dll_FileSize then
              return mp.CLEAN
            end
            local l_0_26 = "Appomaly_LoadedDlls_Version"
            local l_0_27 = 31536000
            local l_0_28 = 1000
            local l_0_29 = l_0_1 .. l_0_3 .. l_0_21.Dll_FileSize
            l_0_21.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_26, l_0_29) or ""
            if l_0_21.Dll_VersionInfo == "" then
              do
                if not (sysio.GetPEVersionInfo)(l_0_2) then
                  local l_0_30, l_0_31, l_0_32, l_0_33 = {}
                end
                -- DECOMPILER ERROR at PC292: Confused about usage of register: R22 in 'UnsetPending'

                l_0_21.Dll_VersionInfo = l_0_30
                -- DECOMPILER ERROR at PC293: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC298: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC303: Confused about usage of register: R22 in 'UnsetPending'

                do
                  local l_0_34 = nil
                  AppendToRollingQueue(l_0_26, l_0_29, (l_0_30.OriginalFilename or "") .. "|" .. (l_0_30.CompanyName or "") .. "|" .. (l_0_30.FileDescription or ""), l_0_27, l_0_28)
                  if (string.find)(l_0_21.Dll_VersionInfo, "Microsoft", 1, true) then
                    return mp.CLEAN
                  end
                  local l_0_35, l_0_36 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_26, l_0_1 .. l_0_3)
                  if not l_0_36 then
                    l_0_21.Dll_PrevVersionInfo = {}
                    local l_0_38 = l_0_2:match("^(.*)\\")
                    if l_0_38 == l_0_0:match("^(.*)\\") then
                      (bm.trigger_sig)("PotentialSideLoadingEvaluator", l_0_0 .. "|" .. l_0_2)
                    end
                    local l_0_39 = nil
                    -- DECOMPILER ERROR at PC363: Unhandled construct in 'MakeBoolean' P1

                    if IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3) and IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3) ~= "NONE" then
                      l_0_21.POTENTIAL_SIDE_LOADING = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3)
                    end
                    local l_0_40 = nil
                    -- DECOMPILER ERROR at PC374: Overwrote pending register: R27 in 'AssignReg'

                    -- DECOMPILER ERROR at PC385: Overwrote pending register: R27 in 'AssignReg'

                    if not (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_3) or (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_3) then
                      do
                        AppendToRollingQueue("SYSTEM_DLLs", l_0_3, "NONE", 31104000, 5000)
                        if not l_0_17 then
                          local l_0_41, l_0_42 = , safeJsonSerialize(l_0_21, 150, nil, true)
                          local l_0_43 = nil
                          local l_0_44 = bm.add_related_string
                          l_0_44("Additional_Info", l_0_42 or l_0_43 or "", bm.RelatedStringBMReport)
                          l_0_44 = bm
                          l_0_44 = l_0_44.add_related_file
                          l_0_44(l_0_2)
                          l_0_44 = mp
                          l_0_44 = l_0_44.INFECTED
                          return l_0_44
                        end
                        do
                          do
                            do return mp.CLEAN end
                            -- DECOMPILER ERROR at PC423: freeLocal<0 in 'ReleaseLocals'

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

