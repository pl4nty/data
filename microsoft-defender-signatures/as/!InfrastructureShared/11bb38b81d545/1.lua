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
      local l_0_9 = 0
      if l_0_6 and l_0_7 then
        for l_0_13,l_0_14 in ipairs(l_0_7) do
          if (string.find)(l_0_14.value, "UnsignedFile", 1, true) then
            l_0_9 = l_0_9 + 50
            l_0_8.FileDroppedRecently = true
            l_0_8.FileInfo = l_0_7
            if (string.find)(l_0_14.value, "FileAttributes", 1, true) then
              local l_0_15 = (string.match)(l_0_14.value, "%[(.*)%]")
              for l_0_19 in (string.gmatch)(l_0_15, "([^|]+)") do
                if l_0_19 ~= "SLF:Aurora.A!rfn" then
                  l_0_9 = l_0_9 + 1
                end
              end
            end
            break
          end
        end
        do
          if not l_0_8.FileDroppedRecently then
            return mp.CLEAN
          end
          local l_0_20 = (string.gsub)(l_0_2, "%d+", "0")
          local l_0_21 = (string.gsub)(l_0_3, "%d+", "0")
          local l_0_22 = l_0_1 .. "|" .. l_0_21 .. "|" .. l_0_20
          local l_0_23, l_0_24, l_0_25 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_22, 2, "MarkerRecord_" .. l_0_1)
          if l_0_23 then
            local l_0_26 = (MpCommon.GetOriginalFileName)(l_0_0)
            do
              do
                if not l_0_26 then
                  local l_0_27 = (sysio.GetPEVersionInfo)(l_0_0)
                  if l_0_27 and l_0_27.OriginalFilename then
                    l_0_26 = l_0_27.OriginalFilename
                    ;
                    (MpCommon.SetOriginalFileName)(l_0_0, l_0_26)
                  end
                end
                if l_0_26 then
                  l_0_22 = l_0_26 .. "|" .. l_0_21 .. "|" .. l_0_20
                  l_0_23 = AnomalyTableCheck("Appomaly_LoadedDlls_Path_Normalized", l_0_22, 2, "MarkerRecord_" .. l_0_1)
                end
                ;
                (bm.add_related_string)("Anomaly_LoadedDlls_TblInfo", safeJsonSerialize(l_0_25), bm.RelatedStringBMReport)
                l_0_8.AppName = l_0_1
                l_0_8.Dll_Path = l_0_2
                l_0_8.Key = l_0_22
                l_0_8.Dll_FileSize = (sysio.GetFileSize)(l_0_2) or 0
                local l_0_28 = "Appomaly_LoadedDlls_Size"
                local l_0_29 = 31536000
                local l_0_30 = 1000
                local l_0_31 = l_0_1 .. l_0_3
                l_0_8.Dll_PrevFileSize = GetRollingQueueKeyValue(l_0_28, l_0_31) or -1
                if (l_0_8.Dll_PrevFileSize == -1 or l_0_8.Dll_PrevFileSize == 0) and l_0_8.Dll_FileSize > 0 then
                  AppendToRollingQueue(l_0_28, l_0_31, l_0_8.Dll_FileSize, l_0_29, l_0_30)
                else
                  l_0_8.Dll_PrevFileSize = tonumber(l_0_8.Dll_PrevFileSize)
                  if l_0_8.Dll_PrevFileSize * 2 < l_0_8.Dll_FileSize or l_0_8.Dll_FileSize < l_0_8.Dll_PrevFileSize / 2 then
                    l_0_8.DllFileSizeAnomalous = true
                  end
                end
                if l_0_8.Dll_PrevFileSize == -1 and not l_0_24 then
                  l_0_8.DLLLoadAfterTraining = true
                end
                if not l_0_23 and not l_0_24 and not l_0_8.DllFileSizeAnomalous then
                  return mp.CLEAN
                end
                if l_0_8.Dll_PrevFileSize == l_0_8.Dll_FileSize then
                  return mp.CLEAN
                end
                local l_0_32 = "Appomaly_LoadedDlls_Version"
                local l_0_33 = 31536000
                local l_0_34 = 1000
                local l_0_35 = l_0_1 .. l_0_3 .. l_0_8.Dll_FileSize
                l_0_8.Dll_VersionInfo = GetRollingQueueKeyValue(l_0_32, l_0_35) or ""
                if l_0_8.Dll_VersionInfo == "" then
                  do
                    if not (sysio.GetPEVersionInfo)(l_0_2) then
                      local l_0_36, l_0_37, l_0_38, l_0_39 = {}
                    end
                    -- DECOMPILER ERROR at PC323: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC328: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC333: Confused about usage of register: R24 in 'UnsetPending'

                    do
                      local l_0_40 = nil
                      l_0_8.Dll_VersionInfo = (l_0_36.OriginalFilename or "") .. "|" .. (l_0_36.CompanyName or "") .. "|" .. (l_0_36.FileDescription or "")
                      -- DECOMPILER ERROR at PC342: Confused about usage of register: R25 in 'UnsetPending'

                      AppendToRollingQueue(l_0_32, l_0_35, (l_0_36.OriginalFilename or "") .. "|" .. (l_0_36.CompanyName or "") .. "|" .. (l_0_36.FileDescription or ""), l_0_33, l_0_34)
                      if (string.find)(l_0_8.Dll_VersionInfo, "Microsoft", 1, true) then
                        return mp.CLEAN
                      end
                      local l_0_41, l_0_42 = pcall(MpCommon.RollingQueueQueryKeyRegex, l_0_32, l_0_1 .. l_0_3)
                      if not l_0_42 then
                        l_0_8.Dll_PrevVersionInfo = {}
                        if l_0_8.Dll_VersionInfo ~= "||" and l_0_8.Dll_VersionInfo == (l_0_8.Dll_PrevVersionInfo).value then
                          return mp.CLEAN
                        end
                        if l_0_8.Dll_VersionInfo ~= "||" then
                          for l_0_47,i_2 in ipairs(l_0_42) do
                            if i_2.value == l_0_8.Dll_VersionInfo then
                              return mp.CLEAN
                            end
                          end
                        end
                        do
                          local l_0_48 = l_0_2:match("^(.*)\\")
                          local l_0_49 = l_0_0:match("^(.*)\\")
                          if l_0_48 == l_0_49 then
                            l_0_8.SameDirectory = true
                            l_0_9 = l_0_9 + 10
                          end
                          local l_0_50, l_0_51 = IsKeyInRollingQueue("SYSTEM_DLLs", l_0_3)
                          -- DECOMPILER ERROR at PC415: Unhandled construct in 'MakeBoolean' P1

                          if l_0_51 and l_0_51 ~= "NONE" then
                            l_0_8.POTENTIAL_SIDE_LOADING = l_0_51
                            l_0_9 = l_0_9 + 50
                          end
                          do
                            local l_0_52 = "NONE"
                            if (sysio.IsFileExists)("c:\\Windows\\System32\\" .. l_0_3) then
                              l_0_52 = "System32"
                              l_0_8.POTENTIAL_SIDE_LOADING = "System32"
                              l_0_9 = l_0_9 + 50
                            else
                              if (sysio.IsFileExists)("c:\\Windows\\SysWOW64\\" .. l_0_3) then
                                l_0_52 = "SysWOW64"
                                l_0_8.POTENTIAL_SIDE_LOADING = "SysWOW64"
                                l_0_9 = l_0_9 + 50
                              end
                            end
                            AppendToRollingQueue("SYSTEM_DLLs", l_0_3, l_0_52, 31104000, 1000)
                            if not l_0_24 then
                              local l_0_53, l_0_54, l_0_55 = IsDllInExpectedPath(l_0_3, l_0_48, l_0_1)
                              if l_0_53 and l_0_54 then
                                return mp.CLEAN
                              end
                              if l_0_53 then
                                l_0_9 = l_0_9 + 50
                              end
                              if l_0_55 then
                                l_0_9 = l_0_9 + 50
                              end
                              l_0_8.Known_VulnerableDll = l_0_53
                              l_0_8.Vulnerable_App = l_0_55
                              local l_0_56, l_0_57 = safeJsonSerialize(l_0_8, 150, nil, true)
                              local l_0_58 = bm.add_related_string
                              local l_0_59 = "Additional_Info"
                              l_0_58(l_0_59, l_0_56 or l_0_57 or "", bm.RelatedStringBMReport)
                              l_0_58 = bm
                              l_0_58 = l_0_58.add_related_string
                              l_0_59 = "Score"
                              l_0_58(l_0_59, l_0_9, bm.RelatedStringBMReport)
                              l_0_58 = bm
                              l_0_58 = l_0_58.add_related_file
                              l_0_59 = l_0_2
                              l_0_58(l_0_59)
                              l_0_58 = mp
                              l_0_58 = l_0_58.INFECTED
                              return l_0_58
                            end
                            do
                              do
                                do return mp.CLEAN end
                                -- DECOMPILER ERROR at PC505: freeLocal<0 in 'ReleaseLocals'

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

