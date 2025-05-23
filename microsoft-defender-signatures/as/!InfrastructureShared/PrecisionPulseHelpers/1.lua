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
          l_1_47 = AppendToRollingQueueNamespaced
          l_1_48 = "hmdprecisionpulsefullfilepathscan"
          l_1_49 = l_1_2
          l_1_47(l_1_48, l_1_49, l_1_45, 1, l_1_6, 500, 1)
          l_1_47 = mp
          l_1_47 = l_1_47.TriggerScanResource
          l_1_48 = "file"
          l_1_49 = l_1_45
          l_1_47(l_1_48, l_1_49, 0, 5000)
        end
      end
      do
        l_1_27 = l_1_18.scanfile
        if l_1_27 then
          l_1_27 = l_1_18.scanfile
          l_1_28 = split
          l_1_28 = l_1_28(l_1_27, ",")
          for l_1_53,l_1_54 in ipairs(l_1_28) do
            local l_1_55 = (string.lower)((MpCommon.Base64Decode)(l_1_54))
            local l_1_56 = table.insert
            local l_1_57 = l_1_9.Processed
            local l_1_58 = {}
            l_1_58.scanfile = l_1_55
            l_1_56(l_1_57, l_1_58)
            l_1_56 = AppendToRollingQueueNamespaced
            l_1_57 = "hmdprecisionpulsescanfile"
            l_1_58 = l_1_2
            l_1_56(l_1_57, l_1_58, l_1_55, 1, l_1_6, 500, 1)
          end
        end
        do
          do
            l_1_27 = l_1_18.enumeratefolder
            if l_1_27 then
              l_1_27 = ""
              l_1_28 = "*"
              local l_1_59 = 0
              local l_1_60 = true
              local l_1_61 = false
              local l_1_62 = l_1_18.enumeratefolder
              local l_1_63 = split(l_1_62, ",")
              for l_1_67,l_1_68 in ipairs(l_1_63) do
                local l_1_69 = (string.lower)((MpCommon.Base64Decode)(l_1_68))
                local l_1_70 = explode(l_1_69, "|")
                if #l_1_70 == 4 then
                  l_1_27 = l_1_70[1]
                  l_1_28 = l_1_70[2]
                  l_1_59 = tonumber(l_1_70[3]) or 0
                  l_1_60 = tonumber(l_1_70[4]) == 1
                elseif #l_1_70 == 5 then
                  l_1_27 = l_1_70[1]
                  l_1_28 = l_1_70[2]
                  l_1_59 = tonumber(l_1_70[3]) or 0
                  l_1_60 = tonumber(l_1_70[4]) == 1
                  l_1_61 = tonumber(l_1_70[5]) == 1
                else
                  l_1_27 = l_1_70[1]
                end
                if l_1_27 ~= nil then
                  local l_1_71 = #l_1_27 + 2
                  -- DECOMPILER ERROR at PC397: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  (l_1_9.FolderEnumeration)[l_1_27] = {}
                  -- DECOMPILER ERROR at PC401: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  ((l_1_9.FolderEnumeration)[l_1_27]).Files = {}
                  -- DECOMPILER ERROR at PC405: Confused about usage of register: R30 in 'UnsetPending'

                  ;
                  ((l_1_9.FolderEnumeration)[l_1_27]).Subfolders = {}
                  local l_1_72 = (sysio.FindFiles)(l_1_27, l_1_28, l_1_59)
                  local l_1_73 = (sysio.FindFolders)(l_1_27, "*", 0)
                  if l_1_72 ~= nil then
                    for l_1_77,l_1_78 in pairs(l_1_72) do
                      local l_1_79 = (string.sub)(l_1_78, l_1_71)
                      if l_1_61 then
                        local l_1_80 = (sysio.GetFileSize)(l_1_78)
                        local l_1_81 = (sysio.GetFileLastWriteTime)(l_1_78)
                        local l_1_82 = table.insert
                        local l_1_83 = ((l_1_9.FolderEnumeration)[l_1_27]).Files
                        local l_1_84 = {}
                        l_1_84.Name = l_1_79
                        l_1_84.Size = l_1_80
                        l_1_84.LastModified = l_1_81
                        l_1_82(l_1_83, l_1_84)
                      end
                      if l_1_60 then
                        local l_1_85 = l_1_8
                        local l_1_86 = (MpCommon.AtomicCounterAddNamespaced)(l_1_3, l_1_2, 1)
                        -- DECOMPILER ERROR at PC462: Confused about usage of register: R40 in 'UnsetPending'

                        if l_1_85 <= l_1_86 then
                          ((l_1_9.FolderEnumeration)[l_1_27]).ExceededMaxScanCounter = true
                          break
                        else
                          AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_1_2, (string.lower)(l_1_78), 1, l_1_6, 500, 1)
                          ;
                          (mp.TriggerScanResource)("file", (string.lower)(l_1_78), 0)
                        end
                      end
                    end
                  end
                  local l_1_87 = table.insert
                  local l_1_88 = l_1_9.Processed
                  local l_1_89 = {}
                  l_1_89.enumeratefolder = l_1_27
                  l_1_87(l_1_88, l_1_89)
                  l_1_87 = sysio
                  l_1_87 = l_1_87.IsFolderExists
                  l_1_88 = l_1_27
                  l_1_87 = l_1_87(l_1_88)
                  if l_1_87 then
                    l_1_88 = l_1_9.FolderEnumeration
                    l_1_88 = l_1_88[l_1_27]
                    l_1_88.Exists = true
                    l_1_88 = l_1_9.FolderEnumeration
                    l_1_88 = l_1_88[l_1_27]
                    l_1_89 = sysio
                    l_1_89 = l_1_89.IsPathAVExcluded
                    l_1_89 = l_1_89(l_1_27, true)
                    l_1_88.Excluded = l_1_89
                  else
                    l_1_88 = l_1_9.FolderEnumeration
                    l_1_88 = l_1_88[l_1_27]
                    l_1_88.Exists = false
                  end
                  if l_1_61 == false then
                    l_1_88 = table
                    l_1_88 = l_1_88.insert
                    l_1_89 = l_1_9.FolderEnumeration
                    l_1_89 = l_1_89[l_1_27]
                    local l_1_90 = {}
                    l_1_90.Files = l_1_72
                    l_1_88(l_1_89, l_1_90)
                  end
                  if l_1_73 ~= nil then
                    l_1_88 = pairs
                    l_1_89 = l_1_73
                    l_1_88 = l_1_88(l_1_89)
                    for i_1,i_2 in l_1_88 do
                      local l_1_94 = (string.sub)(l_1_93, l_1_71)
                      ;
                      (table.insert)(((l_1_9.FolderEnumeration)[l_1_27]).Subfolders, l_1_94)
                    end
                  end
                  AppendToRollingQueueNamespaced("hmdprecisionpulseenumeratefolder", l_1_2, l_1_27, 1, l_1_6, 500, 1)
                  -- DECOMPILER ERROR at PC553: Confused about usage of register R34 for local variables in 'ReleaseLocals'

                end
              end
            end
            l_1_27 = l_1_18.enumerateregistrykey
            if l_1_27 then
              l_1_27 = ""
              l_1_28 = l_1_18.enumerateregistrykey
              l_1_59 = split
              l_1_60 = l_1_28
              l_1_61 = ","
              l_1_59 = l_1_59(l_1_60, l_1_61)
              local l_1_95 = nil
              l_1_60 = ipairs
              l_1_61 = l_1_59
              l_1_60 = l_1_60(l_1_61)
              for l_1_63,l_1_100 in l_1_60 do
                local l_1_96, l_1_97, l_1_98, l_1_99, l_1_100 = nil
                local l_1_101 = nil
                l_1_27 = (string.lower)((MpCommon.Base64Decode)(l_1_64))
                if l_1_27 ~= nil then
                  local l_1_102 = nil
                  -- DECOMPILER ERROR at PC584: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC588: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC592: Confused about usage of register: R25 in 'UnsetPending'

                  local l_1_103 = nil
                  local l_1_104 = nil
                  -- DECOMPILER ERROR at PC603: Overwrote pending register: R27 in 'AssignReg'

                  -- DECOMPILER ERROR at PC604: Overwrote pending register: R27 in 'AssignReg'

                  -- DECOMPILER ERROR at PC606: Overwrote pending register: R28 in 'AssignReg'

                  -- DECOMPILER ERROR at PC607: Overwrote pending register: R28 in 'AssignReg'

                  if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_1_27)) ~= nil then
                    l_1_69(l_1_70, l_1_71)
                    -- DECOMPILER ERROR at PC612: Overwrote pending register: R27 in 'AssignReg'

                    -- DECOMPILER ERROR at PC613: Overwrote pending register: R28 in 'AssignReg'

                    if (sysio.RegEnumValues)(l_1_69) ~= nil then
                      l_1_69 = l_1_69(l_1_70)
                      for l_1_72,l_1_73 in l_1_69 do
                        local l_1_105, l_1_106, l_1_107, l_1_108, l_1_109 = nil
                        l_1_87 = sysio
                        l_1_87 = l_1_87.GetRegValueType
                        l_1_87 = (l_1_87((sysio.RegOpenKey)(l_1_27), l_1_95))
                        local l_1_110 = nil
                        local l_1_111 = nil
                        -- DECOMPILER ERROR at PC624: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC625: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC632: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC633: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC634: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC637: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC638: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC639: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC640: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC641: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC642: Overwrote pending register: R35 in 'AssignReg'

                        -- DECOMPILER ERROR at PC643: Overwrote pending register: R36 in 'AssignReg'

                        if not l_1_95 then
                          l_1_98 = " (REG_SZ)"
                          -- DECOMPILER ERROR at PC645: Overwrote pending register: R36 in 'AssignReg'

                          l_1_95(l_1_96, l_1_97)
                          -- DECOMPILER ERROR at PC650: Overwrote pending register: R34 in 'AssignReg'

                          -- DECOMPILER ERROR at PC651: Overwrote pending register: R34 in 'AssignReg'

                          -- DECOMPILER ERROR at PC652: Overwrote pending register: R35 in 'AssignReg'

                          -- DECOMPILER ERROR at PC653: Overwrote pending register: R36 in 'AssignReg'

                          if l_1_87 == 2 then
                            l_1_95 = l_1_95(l_1_96, l_1_97)
                            -- DECOMPILER ERROR at PC659: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC660: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC663: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC664: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC665: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC666: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC667: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC668: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC669: Overwrote pending register: R36 in 'AssignReg'

                            l_1_98 = " (REG_EXPAND_SZ)"
                            -- DECOMPILER ERROR at PC671: Overwrote pending register: R36 in 'AssignReg'

                            l_1_95(l_1_96, l_1_97)
                          else
                            -- DECOMPILER ERROR at PC676: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC677: Overwrote pending register: R34 in 'AssignReg'

                            -- DECOMPILER ERROR at PC678: Overwrote pending register: R35 in 'AssignReg'

                            -- DECOMPILER ERROR at PC679: Overwrote pending register: R36 in 'AssignReg'

                            if l_1_87 == 3 then
                              l_1_95 = l_1_95(l_1_96, l_1_97)
                              -- DECOMPILER ERROR at PC685: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC686: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC689: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC690: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC691: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC692: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC693: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC694: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC695: Overwrote pending register: R36 in 'AssignReg'

                              l_1_98 = " (REG_BINARY)"
                              -- DECOMPILER ERROR at PC697: Overwrote pending register: R36 in 'AssignReg'

                              l_1_95(l_1_96, l_1_97)
                            else
                              -- DECOMPILER ERROR at PC702: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC703: Overwrote pending register: R34 in 'AssignReg'

                              -- DECOMPILER ERROR at PC704: Overwrote pending register: R35 in 'AssignReg'

                              -- DECOMPILER ERROR at PC705: Overwrote pending register: R36 in 'AssignReg'

                              if l_1_87 == 4 then
                                l_1_95 = l_1_95(l_1_96, l_1_97)
                                -- DECOMPILER ERROR at PC711: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC712: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC715: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC716: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC717: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC718: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC719: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC720: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC721: Overwrote pending register: R36 in 'AssignReg'

                                l_1_98 = " (REG_DWORD)"
                                -- DECOMPILER ERROR at PC723: Overwrote pending register: R36 in 'AssignReg'

                                l_1_95(l_1_96, l_1_97)
                              else
                                -- DECOMPILER ERROR at PC728: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC729: Overwrote pending register: R34 in 'AssignReg'

                                -- DECOMPILER ERROR at PC730: Overwrote pending register: R35 in 'AssignReg'

                                -- DECOMPILER ERROR at PC731: Overwrote pending register: R36 in 'AssignReg'

                                if l_1_87 == 7 then
                                  l_1_95 = l_1_95(l_1_96, l_1_97)
                                  -- DECOMPILER ERROR at PC737: Overwrote pending register: R34 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC738: Overwrote pending register: R34 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC741: Overwrote pending register: R34 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC742: Overwrote pending register: R35 in 'AssignReg'

                                  l_1_95 = l_1_95(l_1_96)
                                  for l_1_98,l_1_99 in l_1_95 do
                                    local l_1_112, l_1_113, l_1_114, l_1_115, l_1_116 = nil
                                    l_1_100 = table
                                    l_1_100 = l_1_100.insert
                                    l_1_101 = l_1_9.RegkeyEnumeration
                                    l_1_101 = l_1_101[l_1_27]
                                    l_1_101 = l_1_101.Values
                                    l_1_101 = l_1_101[l_1_73]
                                    l_1_102 = l_1_99
                                    l_1_103 = " (REG_MULTI_SZ)"
                                    l_1_102 = l_1_102 .. l_1_103
                                    l_1_100(l_1_101, l_1_102)
                                  end
                                else
                                  -- DECOMPILER ERROR at PC762: Overwrote pending register: R35 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC763: Overwrote pending register: R36 in 'AssignReg'

                                  -- DECOMPILER ERROR at PC772: Confused about usage of register: R34 in 'UnsetPending'

                                  if not (sysio.GetRegValueAsQword)(l_1_96, l_1_97) then
                                    do
                                      (table.insert)((((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_73], (l_1_87 ~= 11 or "Value not set") .. " (REG_QWORD)")
                                      -- DECOMPILER ERROR at PC796: Confused about usage of register: R34 in 'UnsetPending'

                                      ;
                                      (table.insert)((((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_73], ((sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_1_27), l_1_73) or "Value not set") .. " (UNKNOWN TYPE)")
                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_THEN_STMT

                                      -- DECOMPILER ERROR at PC807: LeaveBlock: unexpected jumping out IF_STMT

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
                  local l_1_117 = nil
                  -- DECOMPILER ERROR at PC811: Overwrote pending register: R28 in 'AssignReg'

                  local l_1_118 = nil
                  do
                    local l_1_119 = nil
                    ;
                    (table.insert)(l_1_70, {enumerateregistrykey = l_1_27})
                    -- DECOMPILER ERROR at PC815: Confused about usage of register R38 for local variables in 'ReleaseLocals'

                    -- DECOMPILER ERROR at PC815: LeaveBlock: unexpected jumping out DO_STMT

                    -- DECOMPILER ERROR at PC815: LeaveBlock: unexpected jumping out IF_THEN_STMT

                    -- DECOMPILER ERROR at PC815: LeaveBlock: unexpected jumping out IF_STMT

                  end
                end
              end
            end
            l_1_27 = l_1_18.deleteregistryvalue
            if l_1_27 then
              l_1_27 = ""
              l_1_28 = l_1_18.deleteregistryvalue
              l_1_59 = split
              l_1_59 = l_1_59(l_1_28, ",")
              local l_1_120 = nil
              for l_1_124,l_1_125 in ipairs(l_1_59) do
                local l_1_121, l_1_122, l_1_123, l_1_124, l_1_125 = nil
                local l_1_126 = nil
                if l_1_27 ~= nil then
                  l_1_27 = explode((string.lower)((MpCommon.Base64Decode)(l_1_64)), "|")
                  if #l_1_27 == 2 then
                    local l_1_127 = nil
                    local l_1_128 = nil
                    -- DECOMPILER ERROR at PC851: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC854: Confused about usage of register: R24 in 'UnsetPending'

                    local l_1_129 = nil
                    if (sysio.RegOpenKey)(l_1_27[1]) ~= nil then
                      (mp.set_mpattribute)("/EnablePrecPulseScanner")
                      -- DECOMPILER ERROR at PC865: Confused about usage of register: R24 in 'UnsetPending'

                      local l_1_130 = nil
                      AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_1_2, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]), l_1_87, l_1_6, 500, 1)
                      -- DECOMPILER ERROR at PC882: Overwrote pending register: R32 in 'AssignReg'

                      local l_1_131, l_1_132 = nil
                      -- DECOMPILER ERROR at PC887: Confused about usage of register: R24 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC887: Overwrote pending register: R32 in 'AssignReg'

                      ;
                      (mp.TriggerScanResource)("regkey", l_1_87)
                      -- DECOMPILER ERROR at PC891: Overwrote pending register: R32 in 'AssignReg'

                      AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_1_87, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]), 1, l_1_6, 500, 1)
                      -- DECOMPILER ERROR at PC901: Overwrote pending register: R32 in 'AssignReg'

                      local l_1_133, l_1_134 = nil
                      -- DECOMPILER ERROR at PC905: Overwrote pending register: R32 in 'AssignReg'

                      -- DECOMPILER ERROR at PC906: Overwrote pending register: R32 in 'AssignReg'

                      l_1_87("regkeyvalue", (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]))
                    else
                      -- DECOMPILER ERROR at PC912: Confused about usage of register: R24 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC912: Confused about usage of register: R27 in 'UnsetPending'

                    end
                    local l_1_135 = nil
                    -- DECOMPILER ERROR at PC915: Overwrote pending register: R28 in 'AssignReg'

                    local l_1_136 = nil
                    local l_1_137 = nil
                    -- DECOMPILER ERROR at PC917: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC917: Overwrote pending register: R30 in 'AssignReg'

                    -- DECOMPILER ERROR at PC919: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC919: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_1_2, l_1_87), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_1_87, l_1_2, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2])) .. " " .. l_1_87})
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
                l_1_59 = "%windir%"
                l_1_28 = l_1_28(l_1_59)
                l_1_59 = l_1_28
                l_1_59 = l_1_59 .. "\\system32\\"
                local l_1_138 = nil
                local l_1_139 = nil
                if #(sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe") > 0 then
                  l_1_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).starttime)
                end
              end
              l_1_28 = table
              l_1_28 = l_1_28.insert
              l_1_59 = l_1_9.Processed
              local l_1_140 = nil
              local l_1_141 = nil
              l_1_28(l_1_59, {process = l_1_18.process})
              l_1_28 = MpCommon
              l_1_28 = l_1_28.BmTriggerSig
              l_1_59 = l_1_27
              l_1_28(l_1_59, "Heimdall_ProcessDispatch", l_1_18.process)
            end
            l_1_27 = l_1_18.firewall
            if l_1_27 then
              l_1_27 = l_1_18.firewall
              l_1_28 = split
              l_1_59 = l_1_27
              l_1_28 = l_1_28(l_1_59, ",")
              l_1_59 = ipairs
              l_1_59 = l_1_59(l_1_28)
              for l_1_145,l_1_146 in l_1_59 do
                local l_1_142, l_1_143, l_1_144, l_1_145, l_1_146 = nil
                -- DECOMPILER ERROR at PC987: Confused about usage of register: R21 in 'UnsetPending'

                local l_1_147 = nil
                if (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid) then
                  local l_1_148 = nil
                  local l_1_149 = nil
                  local l_1_150 = nil
                  ;
                  (table.insert)(l_1_9.Processed, {firewall = (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid)})
                  -- DECOMPILER ERROR at PC1006: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1010: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1011: Confused about usage of register: R22 in 'UnsetPending'

                  if #explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_") == 3 then
                    local l_1_151 = nil
                    ;
                    (MpCommon.AddBlockingFirewallRule)((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[1], (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[3], (mp.bitand)(tonumber((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[2]), 2) == 2, (mp.bitand)(tonumber((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[2]), 1) == 1)
                  end
                end
              end
            end
            l_1_27 = l_1_18.sinkholedns
            if l_1_27 then
              l_1_27 = l_1_18.sinkholedns
              l_1_28 = split
              l_1_28 = l_1_28(l_1_27, ",")
              for l_1_160,l_1_161 in ipairs(l_1_28) do
                local l_1_157, l_1_158, l_1_159, l_1_160, l_1_161 = nil
                -- DECOMPILER ERROR at PC1047: Confused about usage of register: R21 in 'UnsetPending'

                local l_1_162 = nil
                local l_1_163 = nil
                local l_1_164 = nil
                local l_1_165 = nil
                ;
                (table.insert)(l_1_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid)})
                -- DECOMPILER ERROR at PC1065: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1069: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1071: Confused about usage of register: R22 in 'UnsetPending'

                if (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid) then
                  local l_1_166 = nil
                  l_1_9["sinkholedns" .. "_" .. (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[1] .. "_" .. (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[2]] = {res = (MpCommon.AddDnsBlockListDomain)((explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[1], (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[2]), isAllowed = (explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))[1]}
                end
              end
            end
            l_1_27 = l_1_18.dnscache
            if l_1_27 then
              l_1_27 = l_1_18.dnscache
              l_1_28 = split
              l_1_28 = l_1_28(l_1_27, ",")
              for l_1_170,l_1_171 in ipairs(l_1_28) do
                local l_1_167, l_1_168, l_1_169, l_1_170, l_1_171 = nil
                -- DECOMPILER ERROR at PC1093: Confused about usage of register: R21 in 'UnsetPending'

                local l_1_172 = nil
                local l_1_173 = nil
                local l_1_174 = nil
                local l_1_175 = nil
                ;
                (table.insert)(l_1_9.Processed, {dnscache = (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid)})
                if (MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid) then
                  for i_1,i_2 in ipairs(explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_")) do
                    local l_1_176, l_1_177, l_1_178 = nil
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
              local l_1_179 = nil
              for l_1_183,l_1_184 in ipairs(l_1_28) do
                local l_1_180, l_1_181, l_1_182, l_1_183, l_1_184 = nil
                -- DECOMPILER ERROR at PC1142: Confused about usage of register: R22 in 'UnsetPending'

                local l_1_185 = nil
                local l_1_186 = nil
                local l_1_187 = nil
                local l_1_188 = nil
                ;
                (table.insert)(l_1_9.Processed, {debug = (MpCommon.Base64Decode)(explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_"))})
                for l_1_192,l_1_193 in ipairs((split((MpCommon.Base64Decode)(explode((MpCommon.Base64Decode)((((sysio.GetProcessFromFileName)(l_1_59 .. "svchost.exe"))[1]).pid), "_")), "_"))) do
                  local l_1_189, l_1_190, l_1_191, l_1_192, l_1_193 = nil
                  -- DECOMPILER ERROR at PC1159: Overwrote pending register: R32 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1160: Confused about usage of register: R31 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1164: Overwrote pending register: R25 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1165: Confused about usage of register: R31 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1165: Overwrote pending register: R26 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1168: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1168: Overwrote pending register: R32 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1171: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PC" then
                    local l_1_194 = nil
                    -- DECOMPILER ERROR at PC1176: Confused about usage of register: R26 in 'UnsetPending'

                  else
                    -- DECOMPILER ERROR at PC1181: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1183: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1183: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1185: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1186: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "PCNP" then
                      local l_1_195 = nil
                      -- DECOMPILER ERROR at PC1191: Confused about usage of register: R26 in 'UnsetPending'

                    else
                      -- DECOMPILER ERROR at PC1196: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1198: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1198: Overwrote pending register: R32 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1200: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1201: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "RQ" then
                        local l_1_196 = nil
                        -- DECOMPILER ERROR at PC1206: Confused about usage of register: R26 in 'UnsetPending'

                      else
                        -- DECOMPILER ERROR at PC1211: Confused about usage of register: R25 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1213: Confused about usage of register: R25 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1213: Overwrote pending register: R32 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1215: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1216: Overwrote pending register: R32 in 'AssignReg'

                        if nil == "AC" then
                          local l_1_197 = nil
                          -- DECOMPILER ERROR at PC1221: Confused about usage of register: R26 in 'UnsetPending'

                        end
                      end
                    end
                  end
                end
              end
              l_1_9.debug = {[l_1_87] = table_pack(pcall(MpCommon.GetPersistContext, nil)), [l_1_87] = table_pack(pcall(MpCommon.GetPersistContextNoPath, nil)), [l_1_87] = table_pack(pcall(MpCommon.RollingQueueQuery, nil)), [l_1_87] = table_pack(pcall(MpCommon.AtomicCounterValueEx, nil))}
            end
            l_1_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
            l_1_10.report = safeJsonSerialize(l_1_9, 260)
            l_1_10.TAG = "NOLOOKUP"
            pcall(mp.GetUrlReputation, l_1_28, l_1_10)
            -- DECOMPILER ERROR at PC1245: Confused about usage of register R37 for local variables in 'ReleaseLocals'

            -- DECOMPILER ERROR: 57 unprocessed JMP targets
          end
        end
      end
    end
  end
end


