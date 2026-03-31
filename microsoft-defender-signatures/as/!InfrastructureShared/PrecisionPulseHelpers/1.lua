-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\PrecisionPulseHelpers\1.luac 

-- params : ...
-- function num : 0
EnablePrecisionPulse = function(l_1_0, l_1_1, l_1_2, l_1_3, l_1_4)
  -- function num : 0_0
  local l_1_5 = 60
  local l_1_6 = 300
  local l_1_7 = nil
  local l_1_8 = 500
  local l_1_9 = {}
  l_1_9.Processed = {}
  l_1_9.FolderEnumeration = {}
  l_1_9.ScanPath = {}
  l_1_9.FullFilePathScan = {}
  l_1_9.RegkeyEnumeration = {}
  l_1_9.DeleteRegValue = {}
  local l_1_10 = {}
  l_1_10.SIG_CONTEXT = "LUA_GENERIC"
  l_1_10.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_1_10.TAG = "NOLOOKUP"
  local l_1_11 = {}
  for l_1_15 in l_1_0:gmatch("[^%+][^%+]+") do
    local l_1_16, l_1_17 = l_1_15:match("(.+)::(.+)")
    if l_1_16 and l_1_17 then
      l_1_11[l_1_16] = l_1_17
    end
  end
  local l_1_18 = {}
  local l_1_19 = l_1_11
  for l_1_23,l_1_24 in pairs(l_1_19) do
    local l_1_25 = l_1_23
    l_1_18[l_1_25] = l_1_24
  end
  if l_1_18.tracking_id then
    l_1_7 = l_1_18.tracking_id
  end
  if l_1_7 == nil then
    l_1_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_1_26 = table.insert
  local l_1_27 = l_1_9.Processed
  local l_1_28 = {}
  l_1_28.TrackingId = l_1_7
  l_1_26(l_1_27, l_1_28)
  l_1_26 = l_1_18.ttl
  if l_1_26 then
    l_1_6 = l_1_18.ttl
    l_1_26 = table
    l_1_26 = l_1_26.insert
    l_1_27 = l_1_9.Processed
    l_1_26(l_1_27, l_1_28)
    l_1_28 = {Ttl = l_1_6}
  end
  l_1_26 = l_1_18.suppress_ttl
  if l_1_26 then
    l_1_5 = l_1_18.suppress_ttl
    l_1_26 = table
    l_1_26 = l_1_26.insert
    l_1_27 = l_1_9.Processed
    l_1_26(l_1_27, l_1_28)
    l_1_28 = {suppress_ttl = l_1_5}
  end
  l_1_26 = MpCommon
  l_1_26 = l_1_26.AtomicCounterValueNamespaced
  l_1_27 = l_1_3
  l_1_28 = l_1_2
  l_1_26 = l_1_26(l_1_27, l_1_28)
  if l_1_26 == nil then
    l_1_27 = MpCommon
    l_1_27 = l_1_27.AtomicCounterSetNamespaced
    l_1_28 = l_1_3
    l_1_27(l_1_28, l_1_2, 0, l_1_5)
  end
  l_1_27 = l_1_18.maxscan
  if l_1_27 then
    l_1_27 = tonumber
    l_1_28 = l_1_18.maxscan
    l_1_27 = l_1_27(l_1_28)
    l_1_8 = l_1_27 or 500
    l_1_27 = MpCommon
    l_1_27 = l_1_27.AtomicCounterValueNamespaced
    l_1_28 = l_1_4
    l_1_27 = l_1_27(l_1_28, l_1_2)
    if l_1_27 == nil then
      l_1_28 = MpCommon
      l_1_28 = l_1_28.AtomicCounterSetNamespaced
      l_1_28(l_1_4, l_1_2, l_1_8, l_1_6)
    else
      l_1_28 = MpCommon
      l_1_28 = l_1_28.AtomicCounterSubNamespaced
      l_1_28(l_1_4, l_1_2, l_1_27)
      l_1_28 = MpCommon
      l_1_28 = l_1_28.AtomicCounterAddNamespaced
      l_1_28(l_1_4, l_1_2, l_1_8)
    end
    l_1_28 = table
    l_1_28 = l_1_28.insert
    local l_1_29 = l_1_9.Processed
    local l_1_30 = {}
    l_1_30.max_scan = l_1_8
    l_1_28(l_1_29, l_1_30)
  end
  do
    l_1_27 = l_1_18.scanpath
    if l_1_27 then
      l_1_27 = l_1_18.scanpath
      l_1_28 = split
      l_1_28 = l_1_28(l_1_27, ",")
      for l_1_34,l_1_35 in ipairs(l_1_28) do
        local l_1_36 = (string.lower)((MpCommon.Base64Decode)(l_1_35))
        local l_1_37 = table.insert
        local l_1_38 = l_1_9.Processed
        local l_1_39 = {}
        l_1_39.scanpath = l_1_36
        l_1_37(l_1_38, l_1_39)
        l_1_37 = AppendToRollingQueueNamespaced
        l_1_38 = "hmdprecisionpulsefolderscan"
        l_1_39 = l_1_2
        l_1_37(l_1_38, l_1_39, l_1_36, 1, l_1_6, 500, 1)
        l_1_37 = mp
        l_1_37 = l_1_37.TriggerScanResource
        l_1_38 = "folder"
        l_1_39 = l_1_36
        l_1_37(l_1_38, l_1_39, 0, 5000)
        l_1_37 = l_1_9.ScanPath
        l_1_37[l_1_36], l_1_38 = l_1_38, {}
        l_1_37 = table
        l_1_37 = l_1_37.insert
        l_1_38 = l_1_9.Processed
        l_1_37(l_1_38, l_1_39)
        l_1_39 = {scanpath = l_1_36}
        l_1_37 = sysio
        l_1_37 = l_1_37.IsFolderExists
        l_1_38 = l_1_36
        l_1_37 = l_1_37(l_1_38)
        if l_1_37 then
          l_1_38 = l_1_9.ScanPath
          l_1_38 = l_1_38[l_1_36]
          l_1_38.Exists = true
          l_1_38 = l_1_9.ScanPath
          l_1_38 = l_1_38[l_1_36]
          l_1_39 = sysio
          l_1_39 = l_1_39.IsPathAVExcluded
          l_1_39 = l_1_39(l_1_36, true)
          l_1_38.Excluded = l_1_39
        else
          l_1_38 = l_1_9.ScanPath
          l_1_38 = l_1_38[l_1_36]
          l_1_38.Exists = false
        end
      end
    end
    do
      l_1_27 = l_1_18.fullfilepathscan
      if l_1_27 then
        l_1_27 = l_1_18.fullfilepathscan
        l_1_28 = split
        l_1_28 = l_1_28(l_1_27, ",")
        for l_1_43,l_1_44 in ipairs(l_1_28) do
          local l_1_45 = (string.lower)((MpCommon.Base64Decode)(l_1_44))
          local l_1_46 = (sysio.IsFileExists)(l_1_45)
          local l_1_47 = table.insert
          local l_1_48 = l_1_9.Processed
          local l_1_49 = {}
          l_1_49.fullfilepathscan = l_1_45
          l_1_47(l_1_48, l_1_49)
          l_1_47 = l_1_9.FullFilePathScan
          l_1_47[l_1_45], l_1_48 = l_1_48, {}
          if l_1_46 then
            l_1_47 = string
            l_1_47 = l_1_47.match
            l_1_48 = l_1_45
            l_1_49 = "(.-)[\\/][^\\/]*$"
            l_1_47 = l_1_47(l_1_48, l_1_49)
            l_1_48 = l_1_9.FullFilePathScan
            l_1_48 = l_1_48[l_1_45]
            l_1_48.Exists = true
            l_1_48 = l_1_9.FullFilePathScan
            l_1_48 = l_1_48[l_1_45]
            l_1_49 = sysio
            l_1_49 = l_1_49.IsPathAVExcluded
            l_1_49 = l_1_49(l_1_47, true)
            l_1_48.Excluded = l_1_49
          else
            l_1_47 = l_1_9.FullFilePathScan
            l_1_47 = l_1_47[l_1_45]
            l_1_47.Exists = false
          end
          l_1_47 = pcallEx
          l_1_48 = "AppendToRollingQueueNamespaced"
          l_1_49 = AppendToRollingQueueNamespaced
          l_1_47 = l_1_47(l_1_48, l_1_49, "hmdprecisionpulsefullfilepathscan", l_1_2, l_1_45, 1, l_1_6, 500, 1)
          if not l_1_47 then
            l_1_49 = GetRollingQueueKeys
            l_1_49 = l_1_49("LuaError")
            -- DECOMPILER ERROR at PC292: Confused about usage of register: R27 in 'UnsetPending'

            if l_1_49 and type(l_1_49) == "table" then
              ((l_1_9.FullFilePathScan)[l_1_45]).RQErrors = safeJsonSerialize(l_1_49, 260)
            end
          end
          l_1_49 = mp
          l_1_49 = l_1_49.TriggerScanResource
          l_1_49("file", l_1_45, 0, 10000)
          l_1_49 = MpCommon
          l_1_49 = l_1_49.ExpandEnvironmentVariables
          l_1_49 = l_1_49("%windir%")
          if l_1_49 then
            local l_1_50 = l_1_49 .. "\\system32\\"
            local l_1_51 = (sysio.GetProcessFromFileName)(l_1_50 .. "svchost.exe")
            if #l_1_51 > 0 then
              local l_1_52 = (string.format)("pid:%d,ProcessStart:%u", (l_1_51[1]).pid, (l_1_51[1]).starttime)
              if l_1_52 then
                (MpCommon.BmTriggerSig)(l_1_52, "hmdprecisionpulsefullfilepathscan_statuscheck", l_1_45)
              end
            end
          end
        end
      end
      do
        l_1_27 = l_1_18.scanfile
        if l_1_27 then
          l_1_27 = l_1_18.scanfile
          l_1_28 = split
          l_1_28 = l_1_28(l_1_27, ",")
          for l_1_56,l_1_57 in ipairs(l_1_28) do
            local l_1_58 = (string.lower)((MpCommon.Base64Decode)(l_1_57))
            local l_1_59 = table.insert
            local l_1_60 = l_1_9.Processed
            local l_1_61 = {}
            l_1_61.scanfile = l_1_58
            l_1_59(l_1_60, l_1_61)
            l_1_59 = AppendToRollingQueueNamespaced
            l_1_60 = "hmdprecisionpulsescanfile"
            l_1_61 = l_1_2
            l_1_59(l_1_60, l_1_61, l_1_58, 1, l_1_6, 500, 1)
          end
        end
        do
          do
            l_1_27 = l_1_18.enumeratefolder
            if l_1_27 then
              l_1_27 = ""
              l_1_28 = "*"
              local l_1_62 = 0
              local l_1_63 = true
              local l_1_64 = false
              local l_1_65 = l_1_18.enumeratefolder
              local l_1_66 = split(l_1_65, ",")
              for l_1_70,l_1_71 in ipairs(l_1_66) do
                local l_1_72 = (string.lower)((MpCommon.Base64Decode)(l_1_71))
                local l_1_73 = explode(l_1_72, "|")
                if #l_1_73 == 4 then
                  l_1_27 = l_1_73[1]
                  l_1_28 = l_1_73[2]
                  l_1_62 = tonumber(l_1_73[3]) or 0
                  l_1_63 = tonumber(l_1_73[4]) == 1
                elseif #l_1_73 == 5 then
                  l_1_27 = l_1_73[1]
                  l_1_28 = l_1_73[2]
                  l_1_62 = tonumber(l_1_73[3]) or 0
                  l_1_63 = tonumber(l_1_73[4]) == 1
                  l_1_64 = tonumber(l_1_73[5]) == 1
                else
                  l_1_27 = l_1_73[1]
                end
                if l_1_27 ~= nil then
                  local l_1_74 = #l_1_27 + 2
                  -- DECOMPILER ERROR at PC452: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  (l_1_9.FolderEnumeration)[l_1_27] = {}
                  -- DECOMPILER ERROR at PC456: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  ((l_1_9.FolderEnumeration)[l_1_27]).Files = {}
                  -- DECOMPILER ERROR at PC460: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  ((l_1_9.FolderEnumeration)[l_1_27]).Subfolders = {}
                  local l_1_75 = (sysio.FindFiles)(l_1_27, l_1_28, l_1_62)
                  local l_1_76 = (sysio.FindFolders)(l_1_27, "*", 0)
                  if l_1_75 ~= nil then
                    for l_1_80,l_1_81 in pairs(l_1_75) do
                      local l_1_82 = (string.sub)(l_1_81, l_1_74)
                      if l_1_64 then
                        local l_1_83 = (sysio.GetFileSize)(l_1_81)
                        local l_1_84 = (sysio.GetFileLastWriteTime)(l_1_81)
                        local l_1_85 = table.insert
                        local l_1_86 = ((l_1_9.FolderEnumeration)[l_1_27]).Files
                        local l_1_87 = {}
                        l_1_87.Name = l_1_82
                        l_1_87.Size = l_1_83
                        l_1_87.LastModified = l_1_84
                        l_1_85(l_1_86, l_1_87)
                      end
                      if l_1_63 then
                        local l_1_88 = l_1_8
                        local l_1_89 = (MpCommon.AtomicCounterAddNamespaced)(l_1_3, l_1_2, 1)
                        -- DECOMPILER ERROR at PC517: Confused about usage of register: R40 in 'UnsetPending'

                        if l_1_88 <= l_1_89 then
                          ((l_1_9.FolderEnumeration)[l_1_27]).ExceededMaxScanCounter = true
                          break
                        else
                          AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_1_2, (string.lower)(l_1_81), 1, l_1_6, 500, 1)
                          ;
                          (mp.TriggerScanResource)("file", (string.lower)(l_1_81), 0, 5000)
                        end
                      end
                    end
                  end
                  local l_1_90 = table.insert
                  local l_1_91 = l_1_9.Processed
                  local l_1_92 = {}
                  l_1_92.enumeratefolder = l_1_27
                  l_1_90(l_1_91, l_1_92)
                  l_1_90 = sysio
                  l_1_90 = l_1_90.IsFolderExists
                  l_1_91 = l_1_27
                  l_1_90 = l_1_90(l_1_91)
                  if l_1_90 then
                    l_1_91 = l_1_9.FolderEnumeration
                    l_1_91 = l_1_91[l_1_27]
                    l_1_91.Exists = true
                    l_1_91 = l_1_9.FolderEnumeration
                    l_1_91 = l_1_91[l_1_27]
                    l_1_92 = sysio
                    l_1_92 = l_1_92.IsPathAVExcluded
                    l_1_92 = l_1_92(l_1_27, true)
                    l_1_91.Excluded = l_1_92
                  else
                    l_1_91 = l_1_9.FolderEnumeration
                    l_1_91 = l_1_91[l_1_27]
                    l_1_91.Exists = false
                  end
                  if l_1_64 == false then
                    l_1_91 = table
                    l_1_91 = l_1_91.insert
                    l_1_92 = l_1_9.FolderEnumeration
                    l_1_92 = l_1_92[l_1_27]
                    local l_1_93 = {}
                    l_1_93.Files = l_1_75
                    l_1_91(l_1_92, l_1_93)
                  end
                  if l_1_76 ~= nil then
                    l_1_91 = pairs
                    l_1_92 = l_1_76
                    l_1_91 = l_1_91(l_1_92)
                    for i_1,i_2 in l_1_91 do
                      local l_1_97 = (string.sub)(l_1_96, l_1_74)
                      ;
                      (table.insert)(((l_1_9.FolderEnumeration)[l_1_27]).Subfolders, l_1_97)
                    end
                  end
                  AppendToRollingQueueNamespaced("hmdprecisionpulseenumeratefolder", l_1_2, l_1_27, 1, l_1_6, 500, 1)
                  -- DECOMPILER ERROR at PC609: Confused about usage of register R34 for local variables in 'ReleaseLocals'

                end
              end
            end
            l_1_27 = l_1_18.enumerateregistrykey
            if l_1_27 then
              l_1_27 = ""
              l_1_28 = l_1_18.enumerateregistrykey
              l_1_62 = split
              l_1_63 = l_1_28
              l_1_64 = ","
              l_1_62 = l_1_62(l_1_63, l_1_64)
              local l_1_98 = nil
              l_1_63 = ipairs
              l_1_64 = l_1_62
              l_1_63 = l_1_63(l_1_64)
              for l_1_66,l_1_103 in l_1_63 do
                local l_1_99, l_1_100, l_1_101, l_1_102, l_1_103 = nil
                local l_1_104 = nil
                l_1_27 = (string.lower)((MpCommon.Base64Decode)(l_1_67))
                if l_1_27 ~= nil then
                  local l_1_105 = nil
                  -- DECOMPILER ERROR at PC640: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC644: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC648: Confused about usage of register: R25 in 'UnsetPending'

                  local l_1_106 = nil
                  local l_1_107 = nil
                  -- DECOMPILER ERROR at PC659: Overwrote pending register: R27 in 'AssignReg'

                  -- DECOMPILER ERROR at PC660: Overwrote pending register: R27 in 'AssignReg'

                  -- DECOMPILER ERROR at PC662: Overwrote pending register: R28 in 'AssignReg'

                  -- DECOMPILER ERROR at PC663: Overwrote pending register: R28 in 'AssignReg'

                  if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_1_27)) ~= nil then
                    l_1_72(l_1_73, l_1_74)
                    -- DECOMPILER ERROR at PC668: Overwrote pending register: R27 in 'AssignReg'

                    -- DECOMPILER ERROR at PC669: Overwrote pending register: R28 in 'AssignReg'

                    if (sysio.RegEnumValues)(l_1_72) ~= nil then
                      l_1_72 = l_1_72(l_1_73)
                      for l_1_75,l_1_76 in l_1_72 do
                        local l_1_108, l_1_109, l_1_110, l_1_111, l_1_112 = nil
                        l_1_90 = sysio
                        l_1_90 = l_1_90.GetRegValueType
                        l_1_90 = (l_1_90((sysio.RegOpenKey)(l_1_27), l_1_98))
                        local l_1_113 = nil
                        local l_1_114 = nil
                        -- DECOMPILER ERROR at PC680: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC681: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC688: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC689: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC690: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC693: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC694: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC695: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC696: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC697: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC698: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC699: Overwrote pending register: R36 in 'AssignReg'

                        if not l_1_98 then
                          l_1_101 = " (REG_SZ)"
                          -- DECOMPILER ERROR at PC701: Overwrote pending register: R36 in 'AssignReg'

                          l_1_98(l_1_99, l_1_100)
                          -- DECOMPILER ERROR at PC706: Overwrote pending register: R34 in 'AssignReg'

                          -- DECOMPILER ERROR at PC707: Overwrote pending register: R34 in 'AssignReg'

                          -- DECOMPILER ERROR at PC708: Overwrote pending register: R35 in 'AssignReg'

                          -- DECOMPILER ERROR at PC709: Overwrote pending register: R36 in 'AssignReg'

                          if l_1_90 == 2 then
                            l_1_98 = l_1_98(l_1_99, l_1_100)
                            -- DECOMPILER ERROR at PC715: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC716: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC719: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC720: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC721: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC722: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC723: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC724: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC725: Overwrote pending register: R36 in 'AssignReg'

                            l_1_101 = " (REG_EXPAND_SZ)"
                            -- DECOMPILER ERROR at PC727: Overwrote pending register: R36 in 'AssignReg'

                            l_1_98(l_1_99, l_1_100)
                          else
                            -- DECOMPILER ERROR at PC732: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC733: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC734: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC735: Overwrote pending register: R36 in 'AssignReg'

                            if l_1_90 == 3 then
                              l_1_98 = l_1_98(l_1_99, l_1_100)
                              -- DECOMPILER ERROR at PC741: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC742: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC745: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC746: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC747: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC748: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC749: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC750: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC751: Overwrote pending register: R36 in 'AssignReg'

                              l_1_101 = " (REG_BINARY)"
                              -- DECOMPILER ERROR at PC753: Overwrote pending register: R36 in 'AssignReg'

                              l_1_98(l_1_99, l_1_100)
                            else
                              -- DECOMPILER ERROR at PC758: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC759: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC760: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC761: Overwrote pending register: R36 in 'AssignReg'

                              if l_1_90 == 4 then
                                l_1_98 = l_1_98(l_1_99, l_1_100)
                                -- DECOMPILER ERROR at PC767: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC768: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC771: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC772: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC773: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC774: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC775: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC776: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC777: Overwrote pending register: R36 in 'AssignReg'

                                l_1_101 = " (REG_DWORD)"
                                -- DECOMPILER ERROR at PC779: Overwrote pending register: R36 in 'AssignReg'

                                l_1_98(l_1_99, l_1_100)
                              else
                                -- DECOMPILER ERROR at PC784: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC785: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC786: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC787: Overwrote pending register: R36 in 'AssignReg'

                                if l_1_90 == 7 then
                                  l_1_98 = l_1_98(l_1_99, l_1_100)
                                  -- DECOMPILER ERROR at PC793: Overwrote pending register: R34 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC794: Overwrote pending register: R34 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC797: Overwrote pending register: R34 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC798: Overwrote pending register: R35 in 'AssignReg'

                                  l_1_98 = l_1_98(l_1_99)
                                  for l_1_101,l_1_102 in l_1_98 do
                                    local l_1_115, l_1_116, l_1_117, l_1_118, l_1_119 = nil
                                    l_1_103 = table
                                    l_1_103 = l_1_103.insert
                                    l_1_104 = l_1_9.RegkeyEnumeration
                                    l_1_104 = l_1_104[l_1_27]
                                    l_1_104 = l_1_104.Values
                                    l_1_104 = l_1_104[l_1_76]
                                    l_1_105 = l_1_102
                                    l_1_106 = " (REG_MULTI_SZ)"
                                    l_1_105 = l_1_105 .. l_1_106
                                    l_1_103(l_1_104, l_1_105)
                                  end
                                else
                                  -- DECOMPILER ERROR at PC818: Overwrote pending register: R35 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC819: Overwrote pending register: R36 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC828: Confused about usage of register: R34 in 'UnsetPending'

                                  if not (sysio.GetRegValueAsQword)(l_1_99, l_1_100) then
                                    do
                                      (table.insert)((((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_76], (l_1_90 ~= 11 or "Value not set") .. " (REG_QWORD)")
                                      -- DECOMPILER ERROR at PC852: Confused about usage of register: R34 in 'UnsetPending'

                                      ;
                                      (table.insert)((((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_76], ((sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_1_27), l_1_76) or "Value not set") .. " (UNKNOWN TYPE)")
                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC863: LeaveBlock: unexpected jumping out IF_STMT

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
                  local l_1_120 = nil
                  -- DECOMPILER ERROR at PC867: Overwrote pending register: R28 in 'AssignReg'

                  local l_1_121 = nil
                  do
                    local l_1_122 = nil
                    ;
                    (table.insert)(l_1_73, {enumerateregistrykey = l_1_27})
                    -- DECOMPILER ERROR at PC871: Confused about usage of register R38 for local variables in 'ReleaseLocals'

                    -- DECOMPILER ERROR at PC871: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC871: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC871: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
            l_1_27 = l_1_18.deleteregistryvalue
            if l_1_27 then
              l_1_27 = ""
              l_1_28 = l_1_18.deleteregistryvalue
              l_1_62 = split
              l_1_62 = l_1_62(l_1_28, ",")
              local l_1_123 = nil
              for l_1_127,l_1_128 in ipairs(l_1_62) do
                local l_1_124, l_1_125, l_1_126, l_1_127, l_1_128 = nil
                local l_1_129 = nil
                if l_1_27 ~= nil then
                  l_1_27 = explode((string.lower)((MpCommon.Base64Decode)(l_1_67)), "|")
                  if #l_1_27 == 2 then
                    local l_1_130 = nil
                    local l_1_131 = nil
                    -- DECOMPILER ERROR at PC907: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC910: Confused about usage of register: R24 in 'UnsetPending'

                    local l_1_132 = nil
                    if (sysio.RegOpenKey)(l_1_27[1]) ~= nil then
                      (mp.set_mpattribute)("/EnablePrecPulseScanner")
                      -- DECOMPILER ERROR at PC921: Confused about usage of register: R24 in 'UnsetPending'

                      local l_1_133 = nil
                      AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_1_2, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]), l_1_90, l_1_6, 500, 1)
                      -- DECOMPILER ERROR at PC938: Overwrote pending register: R32 in 'AssignReg'

                      local l_1_134, l_1_135 = nil
                      -- DECOMPILER ERROR at PC943: Confused about usage of register: R24 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC943: Overwrote pending register: R32 in 'AssignReg'

                      ;
                      (mp.TriggerScanResource)("regkey", l_1_90)
                      -- DECOMPILER ERROR at PC947: Overwrote pending register: R32 in 'AssignReg'

                      AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_1_90, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]), 1, l_1_6, 500, 1)
                      -- DECOMPILER ERROR at PC957: Overwrote pending register: R32 in 'AssignReg'

                      local l_1_136, l_1_137 = nil
                      -- DECOMPILER ERROR at PC961: Overwrote pending register: R32 in 'AssignReg'

                      -- DECOMPILER ERROR at PC962: Overwrote pending register: R32 in 'AssignReg'

                      l_1_90("regkeyvalue", (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]))
                    else
                      -- DECOMPILER ERROR at PC968: Confused about usage of register: R24 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC968: Confused about usage of register: R27 in 'UnsetPending'

                    end
                    local l_1_138 = nil
                    -- DECOMPILER ERROR at PC971: Overwrote pending register: R28 in 'AssignReg'

                    local l_1_139 = nil
                    local l_1_140 = nil
                    -- DECOMPILER ERROR at PC973: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC973: Overwrote pending register: R30 in 'AssignReg'

                    -- DECOMPILER ERROR at PC975: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC975: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_1_2, l_1_90), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_1_90, l_1_2, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2])) .. " " .. l_1_90})
                  end
                end
              end
            end
            l_1_27 = l_1_18.process
            if l_1_27 then
              l_1_27 = mp
              l_1_27 = l_1_27.get_contextdata
              l_1_28 = mp
              l_1_28 = l_1_28.CONTEXT_DATA_PROCESS_PPID
              l_1_27 = l_1_27(l_1_28)
              if l_1_27 == nil then
                l_1_28 = MpCommon
                l_1_28 = l_1_28.ExpandEnvironmentVariables
                l_1_62 = "%windir%"
                l_1_28 = l_1_28(l_1_62)
                l_1_62 = l_1_28
                l_1_62 = l_1_62 .. "\\system32\\"
                local l_1_141 = nil
                local l_1_142 = nil
                if #(sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe") > 0 then
                  l_1_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).starttime)
                end
              end
              l_1_28 = table
              l_1_28 = l_1_28.insert
              l_1_62 = l_1_9.Processed
              local l_1_143 = nil
              local l_1_144 = nil
              l_1_28(l_1_62, {process = l_1_18.process})
              l_1_28 = MpCommon
              l_1_28 = l_1_28.BmTriggerSig
              l_1_62 = l_1_27
              l_1_28(l_1_62, "Heimdall_ProcessDispatch", l_1_18.process)
            end
            l_1_27 = l_1_18.firewall
            if l_1_27 then
              l_1_27 = l_1_18.firewall
              l_1_28 = split
              l_1_62 = l_1_27
              l_1_28 = l_1_28(l_1_62, ",")
              l_1_62 = ipairs
              l_1_62 = l_1_62(l_1_28)
              for l_1_148,l_1_149 in l_1_62 do
                local l_1_145, l_1_146, l_1_147, l_1_148, l_1_149 = nil
                -- DECOMPILER ERROR at PC1043: Confused about usage of register: R21 in 'UnsetPending'

                local l_1_150 = nil
                if (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid) then
                  local l_1_151 = nil
                  local l_1_152 = nil
                  local l_1_153 = nil
                  ;
                  (table.insert)(l_1_9.Processed, {firewall = (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid)})
                  -- DECOMPILER ERROR at PC1062: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1066: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1067: Confused about usage of register: R22 in 'UnsetPending'

                  if #explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_") == 3 then
                    local l_1_154 = nil
                    ;
                    (MpCommon.AddBlockingFirewallRule)((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[1], (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[3], (mp.bitand)(tonumber((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[2]), 2) == 2, (mp.bitand)(tonumber((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[2]), 1) == 1)
                  end
                end
              end
            end
            l_1_27 = l_1_18.sinkholedns
            if l_1_27 then
              l_1_27 = l_1_18.sinkholedns
              l_1_28 = split
              l_1_28 = l_1_28(l_1_27, ",")
              for l_1_163,l_1_164 in ipairs(l_1_28) do
                local l_1_160, l_1_161, l_1_162, l_1_163, l_1_164 = nil
                -- DECOMPILER ERROR at PC1103: Confused about usage of register: R21 in 'UnsetPending'

                local l_1_165 = nil
                local l_1_166 = nil
                local l_1_167 = nil
                local l_1_168 = nil
                ;
                (table.insert)(l_1_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid)})
                -- DECOMPILER ERROR at PC1121: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1125: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1127: Confused about usage of register: R22 in 'UnsetPending'

                if (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid) then
                  local l_1_169 = nil
                  l_1_9["sinkholedns" .. "_" .. (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[1] .. "_" .. (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[2]] = {res = (MpCommon.AddDnsBlockListDomain)((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[1], (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[2]), isAllowed = (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))[1]}
                end
              end
            end
            l_1_27 = l_1_18.dnscache
            if l_1_27 then
              l_1_27 = l_1_18.dnscache
              l_1_28 = split
              l_1_28 = l_1_28(l_1_27, ",")
              for l_1_173,l_1_174 in ipairs(l_1_28) do
                local l_1_170, l_1_171, l_1_172, l_1_173, l_1_174 = nil
                -- DECOMPILER ERROR at PC1149: Confused about usage of register: R21 in 'UnsetPending'

                local l_1_175 = nil
                local l_1_176 = nil
                local l_1_177 = nil
                local l_1_178 = nil
                ;
                (table.insert)(l_1_9.Processed, {dnscache = (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid)})
                if (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid) then
                  for i_1,i_2 in ipairs(explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_")) do
                    local l_1_179, l_1_180, l_1_181 = nil
                    l_1_9["dnscache" .. "_" .. i_2] = {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                  end
                end
              end
            end
            l_1_27 = l_1_18.debug
            if l_1_27 then
              l_1_27 = l_1_18.debug
              l_1_28 = split
              l_1_28 = l_1_28(l_1_27, ",")
              local l_1_182 = nil
              for l_1_186,l_1_187 in ipairs(l_1_28) do
                local l_1_183, l_1_184, l_1_185, l_1_186, l_1_187 = nil
                -- DECOMPILER ERROR at PC1198: Confused about usage of register: R22 in 'UnsetPending'

                local l_1_188 = nil
                local l_1_189 = nil
                local l_1_190 = nil
                local l_1_191 = nil
                ;
                (table.insert)(l_1_9.Processed, {debug = (MpCommon.Base64Decode)(explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_"))})
                for l_1_195,l_1_196 in ipairs((split((MpCommon.Base64Decode)(explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_62 .. "svchost.exe"))[1]).pid), "_")), "_"))) do
                  local l_1_192, l_1_193, l_1_194, l_1_195, l_1_196 = nil
                  -- DECOMPILER ERROR at PC1215: Overwrote pending register: R32 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1216: Confused about usage of register: R31 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1220: Overwrote pending register: R25 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1221: Confused about usage of register: R31 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1221: Overwrote pending register: R26 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1224: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1224: Overwrote pending register: R32 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1227: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PC" then
                    local l_1_197 = nil
                    -- DECOMPILER ERROR at PC1232: Confused about usage of register: R26 in 'UnsetPending'

                  else
                    -- DECOMPILER ERROR at PC1237: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1239: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1239: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1241: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1242: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "PCNP" then
                      local l_1_198 = nil
                      -- DECOMPILER ERROR at PC1247: Confused about usage of register: R26 in 'UnsetPending'

                    else
                      -- DECOMPILER ERROR at PC1252: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1254: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1254: Overwrote pending register: R32 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1256: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1257: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "RQ" then
                        local l_1_199 = nil
                        -- DECOMPILER ERROR at PC1262: Confused about usage of register: R26 in 'UnsetPending'

                      else
                        -- DECOMPILER ERROR at PC1267: Confused about usage of register: R25 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1269: Confused about usage of register: R25 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1269: Overwrote pending register: R32 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1271: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1272: Overwrote pending register: R32 in 'AssignReg'

                        if nil == "AC" then
                          local l_1_200 = nil
                          -- DECOMPILER ERROR at PC1277: Confused about usage of register: R26 in 'UnsetPending'

                        end
                      end
                    end
                  end
                end
              end
              l_1_9.debug = {[l_1_90] = table_pack(pcall(MpCommon.GetPersistContext, nil)), [l_1_90] = table_pack(pcall(MpCommon.GetPersistContextNoPath, nil)), [l_1_90] = table_pack(pcall(MpCommon.RollingQueueQuery, nil)), [l_1_90] = table_pack(pcall(MpCommon.AtomicCounterValueEx, nil))}
            end
            l_1_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
            l_1_10.report = safeJsonSerialize(l_1_9, 260)
            l_1_10.TAG = "NOLOOKUP"
            pcall(mp.GetUrlReputation, l_1_28, l_1_10)
            -- DECOMPILER ERROR at PC1301: Confused about usage of register R37 for local variables in 'ReleaseLocals'

            -- DECOMPILER ERROR: 57 unprocessed JMP targets
          end
        end
      end
    end
  end
end


