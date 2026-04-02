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
          l_1_47 = true
          if l_1_46 then
            l_1_48 = string
            l_1_48 = l_1_48.match
            l_1_49 = l_1_45
            l_1_48 = l_1_48(l_1_49, "(.-)[\\/][^\\/]*$")
            l_1_49 = l_1_9.FullFilePathScan
            l_1_49 = l_1_49[l_1_45]
            l_1_49.Exists = true
            l_1_49 = pcall
            l_1_49 = l_1_49(IsAVExcluded, l_1_48)
            do
              if IsAVExcluded == nil then
                local l_1_50, l_1_51, l_1_52 = false
              end
              -- DECOMPILER ERROR at PC266: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_1_9.FullFilePathScan)[l_1_45]).Excluded = (sysio.IsPathAVExcluded)(l_1_48, true)
              -- DECOMPILER ERROR at PC269: Confused about usage of register: R27 in 'UnsetPending'

              -- DECOMPILER ERROR at PC269: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_1_9.FullFilePathScan)[l_1_45]).Excluded_LUA_API = l_1_50
              -- DECOMPILER ERROR at PC275: Confused about usage of register: R27 in 'UnsetPending'

              if ((l_1_9.FullFilePathScan)[l_1_45]).Excluded == true and l_1_50 == true then
                l_1_47 = false
              end
              l_1_47 = false
              l_1_48 = l_1_9.FullFilePathScan
              l_1_48 = l_1_48[l_1_45]
              l_1_48.Exists = false
              l_1_48 = pcallEx
              l_1_49 = "AppendToRollingQueueNamespaced"
              l_1_48 = l_1_48(l_1_49, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_1_2, l_1_45, 1, l_1_6, 500, 1)
              do
                if not l_1_48 then
                  local l_1_53 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC312: Confused about usage of register: R28 in 'UnsetPending'

                  if l_1_53 and type(l_1_53) == "table" then
                    ((l_1_9.FullFilePathScan)[l_1_45]).RQErrors = safeJsonSerialize(l_1_53, 260)
                  end
                end
                if l_1_47 then
                  (mp.TriggerScanResource)("file", l_1_45, 0, 10000)
                  local l_1_54 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_1_54 then
                    local l_1_55 = l_1_54 .. "\\system32\\"
                    local l_1_56 = (sysio.GetProcessFromFileName)(l_1_55 .. "svchost.exe")
                    if #l_1_56 > 0 then
                      local l_1_57 = (string.format)("pid:%d,ProcessStart:%u", (l_1_56[1]).pid, (l_1_56[1]).starttime)
                      if l_1_57 then
                        (MpCommon.BmTriggerSig)(l_1_57, "hmdprecisionpulsefullfilepathscan_statuscheck", l_1_45)
                      end
                    end
                  end
                end
                do
                  -- DECOMPILER ERROR at PC356: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC356: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC356: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC356: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_1_27 = l_1_18.scanfile
      if l_1_27 then
        l_1_27 = l_1_18.scanfile
        l_1_28 = split
        l_1_28 = l_1_28(l_1_27, ",")
        for l_1_61,l_1_62 in ipairs(l_1_28) do
          local l_1_63 = (string.lower)((MpCommon.Base64Decode)(l_1_62))
          local l_1_64 = table.insert
          local l_1_65 = l_1_9.Processed
          local l_1_66 = {}
          l_1_66.scanfile = l_1_63
          l_1_64(l_1_65, l_1_66)
          l_1_64 = AppendToRollingQueueNamespaced
          l_1_65 = "hmdprecisionpulsescanfile"
          l_1_66 = l_1_2
          l_1_64(l_1_65, l_1_66, l_1_63, 1, l_1_6, 500, 1)
        end
      end
      do
        do
          l_1_27 = l_1_18.enumeratefolder
          if l_1_27 then
            l_1_27 = 260
            l_1_28 = ""
            local l_1_67 = "*"
            local l_1_68 = 0
            local l_1_69 = true
            local l_1_70 = false
            local l_1_71 = l_1_18.enumeratefolder
            local l_1_72 = split(l_1_71, ",")
            local l_1_73 = 0
            for l_1_77,l_1_78 in ipairs(l_1_72) do
              l_1_73 = l_1_73 + 1
              -- DECOMPILER ERROR at PC418: Confused about usage of register: R29 in 'UnsetPending'

              if l_1_27 < l_1_73 then
                ((l_1_9.FolderEnumeration)[l_1_28]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_1_79 = (string.lower)((MpCommon.Base64Decode)(l_1_78))
              local l_1_80 = explode(l_1_79, "|")
              if #l_1_80 == 4 then
                l_1_28 = l_1_80[1]
                l_1_67 = l_1_80[2]
                l_1_68 = tonumber(l_1_80[3]) or 0
                l_1_69 = tonumber(l_1_80[4]) == 1
              elseif #l_1_80 == 5 then
                l_1_28 = l_1_80[1]
                l_1_67 = l_1_80[2]
                l_1_68 = tonumber(l_1_80[3]) or 0
                l_1_69 = tonumber(l_1_80[4]) == 1
                l_1_70 = tonumber(l_1_80[5]) == 1
              else
                l_1_28 = l_1_80[1]
              end
              if l_1_28 ~= nil then
                local l_1_81 = #l_1_28 + 2
                -- DECOMPILER ERROR at PC483: Confused about usage of register: R32 in 'UnsetPending'

                ;
                (l_1_9.FolderEnumeration)[l_1_28] = {}
                -- DECOMPILER ERROR at PC487: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_1_9.FolderEnumeration)[l_1_28]).Files = {}
                -- DECOMPILER ERROR at PC491: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_1_9.FolderEnumeration)[l_1_28]).Subfolders = {}
                local l_1_82 = (sysio.FindFiles)(l_1_28, l_1_67, l_1_68)
                local l_1_83 = (sysio.FindFolders)(l_1_28, "*", 0)
                if l_1_82 ~= nil then
                  local l_1_84 = 0
                  for l_1_88,l_1_89 in pairs(l_1_82) do
                    l_1_84 = l_1_84 + 1
                    -- DECOMPILER ERROR at PC516: Confused about usage of register: R40 in 'UnsetPending'

                    if l_1_27 < l_1_84 then
                      ((l_1_9.FolderEnumeration)[l_1_28]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC520: Confused about usage of register: R40 in 'UnsetPending'

                      ;
                      ((l_1_9.FolderEnumeration)[l_1_28]).TotalFilesEnumerated = #l_1_82
                      break
                    end
                    local l_1_90 = (string.sub)(l_1_89, l_1_81)
                    if l_1_70 then
                      local l_1_91 = (sysio.GetFileSize)(l_1_89)
                      local l_1_92 = (sysio.GetFileLastWriteTime)(l_1_89)
                      local l_1_93 = table.insert
                      local l_1_94 = ((l_1_9.FolderEnumeration)[l_1_28]).Files
                      local l_1_95 = {}
                      l_1_95.Name = l_1_90
                      l_1_95.Size = l_1_91
                      l_1_95.LastModified = l_1_92
                      l_1_93(l_1_94, l_1_95)
                      l_1_84 = l_1_84 + 1
                    end
                    if l_1_69 then
                      local l_1_96 = l_1_8
                      local l_1_97 = (MpCommon.AtomicCounterAddNamespaced)(l_1_3, l_1_2, 1)
                      -- DECOMPILER ERROR at PC561: Confused about usage of register: R43 in 'UnsetPending'

                      if l_1_96 <= l_1_97 then
                        ((l_1_9.FolderEnumeration)[l_1_28]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_1_2, (string.lower)(l_1_89), 1, l_1_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_1_89), 0, 5000)
                      end
                    end
                  end
                end
                l_1_84 = table
                l_1_84 = l_1_84.insert
                local l_1_98 = nil
                l_1_98 = l_1_9.Processed
                local l_1_99 = nil
                local l_1_100 = nil
                l_1_84(l_1_98, l_1_99)
                l_1_99 = {enumeratefolder = l_1_28}
                l_1_84 = sysio
                l_1_84 = l_1_84.IsFolderExists
                l_1_98 = l_1_28
                l_1_84 = l_1_84(l_1_98)
                if l_1_84 then
                  l_1_98 = l_1_9.FolderEnumeration
                  l_1_98 = l_1_98[l_1_28]
                  l_1_98.Exists = true
                  l_1_98 = l_1_9.FolderEnumeration
                  l_1_98 = l_1_98[l_1_28]
                  l_1_99 = sysio
                  l_1_99 = l_1_99.IsPathAVExcluded
                  l_1_100 = l_1_28
                  l_1_99 = l_1_99(l_1_100, true)
                  l_1_98.Excluded = l_1_99
                else
                  l_1_98 = l_1_9.FolderEnumeration
                  l_1_98 = l_1_98[l_1_28]
                  l_1_98.Exists = false
                end
                if l_1_70 == false then
                  l_1_98 = #l_1_82
                  if l_1_98 <= l_1_27 then
                    l_1_98 = table
                    l_1_98 = l_1_98.insert
                    l_1_99 = l_1_9.FolderEnumeration
                    l_1_99 = l_1_99[l_1_28]
                    local l_1_101 = nil
                    l_1_98(l_1_99, l_1_100)
                    l_1_100 = {Files = l_1_82}
                  else
                    l_1_99 = 1
                    l_1_100 = l_1_27
                    for i = l_1_99, l_1_100 do
                      local l_1_104 = nil
                      l_1_104 = l_1_82[l_1_103]
                    end
                    local l_1_105 = nil
                    local l_1_106 = nil
                    local l_1_107 = nil
                    ;
                    (table.insert)((l_1_9.FolderEnumeration)[l_1_28], l_1_105)
                    l_1_105 = {Files = l_1_98}
                    -- DECOMPILER ERROR at PC645: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_1_9.FolderEnumeration)[l_1_28]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC649: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_1_9.FolderEnumeration)[l_1_28]).TotalFilesEnumerated = #l_1_82
                  end
                end
                -- DECOMPILER ERROR at PC652: Overwrote pending register: R35 in 'AssignReg'

                if l_1_83 ~= nil then
                  for l_1_111,l_1_112 in pairs(l_1_83) do
                    local l_1_111, l_1_112 = nil
                    -- DECOMPILER ERROR at PC657: Overwrote pending register: R35 in 'AssignReg'

                    if l_1_27 < l_1_98 then
                      break
                    end
                    l_1_111 = string
                    l_1_111 = l_1_111.sub
                    l_1_112 = l_1_110
                    l_1_111 = l_1_111(l_1_112, l_1_81)
                    local l_1_113 = nil
                    l_1_112 = table
                    l_1_112 = l_1_112.insert
                    l_1_113 = l_1_9.FolderEnumeration
                    l_1_113 = l_1_113[l_1_28]
                    l_1_113 = l_1_113.Subfolders
                    l_1_112(l_1_113, l_1_111)
                  end
                end
                -- DECOMPILER ERROR at PC675: Overwrote pending register: R35 in 'AssignReg'

                l_1_98("hmdprecisionpulseenumeratefolder", l_1_2, l_1_28, 1, l_1_6, 500, 1)
                -- DECOMPILER ERROR at PC684: Confused about usage of register R37 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_1_27 = l_1_18.enumerateregistrykey
          if l_1_27 then
            l_1_27 = ""
            l_1_28 = l_1_18.enumerateregistrykey
            l_1_67 = split
            l_1_68 = l_1_28
            l_1_69 = ","
            l_1_67 = l_1_67(l_1_68, l_1_69)
            local l_1_114 = nil
            l_1_68 = ipairs
            l_1_69 = l_1_67
            l_1_68 = l_1_68(l_1_69)
            for l_1_71,l_1_72 in l_1_68 do
              local l_1_115, l_1_116, l_1_117, l_1_118, l_1_119 = nil
              l_1_73 = string
              l_1_73 = l_1_73.lower
              l_1_73 = l_1_73((MpCommon.Base64Decode)(l_1_72))
              local l_1_120 = nil
              l_1_27 = l_1_73
              if l_1_27 ~= nil then
                local l_1_121 = nil
                -- DECOMPILER ERROR at PC715: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC719: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC723: Confused about usage of register: R25 in 'UnsetPending'

                local l_1_122 = nil
                local l_1_123 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_1_27)) ~= nil then
                  (table.insert)(((l_1_9.RegkeyEnumeration)[l_1_27]).Keys, l_1_79)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_1_27)) ~= nil then
                    for l_1_80,l_1_81 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_1_27))) do
                      local l_1_124, l_1_125, l_1_126, l_1_127, l_1_128 = nil
                      l_1_82 = sysio
                      l_1_82 = l_1_82.GetRegValueType
                      l_1_83 = (sysio.RegOpenKey)(l_1_27)
                      l_1_84 = l_1_81
                      l_1_82 = (l_1_82(l_1_83, l_1_84))
                      local l_1_129 = nil
                      l_1_83 = nil
                      local l_1_130 = nil
                      if l_1_82 == 1 then
                        l_1_84 = sysio
                        l_1_84 = l_1_84.GetRegValueAsString
                        -- DECOMPILER ERROR at PC757: Overwrote pending register: R35 in 'AssignReg'

                        l_1_84 = l_1_84(l_1_98, l_1_81)
                        l_1_83 = l_1_84 or "Value not set"
                        l_1_84 = l_1_9.RegkeyEnumeration
                        l_1_84 = l_1_84[l_1_27]
                        l_1_84 = l_1_84.Values
                        l_1_84[l_1_81], l_1_98 = l_1_98, {}
                        l_1_84 = table
                        l_1_84 = l_1_84.insert
                        l_1_98 = l_1_9.RegkeyEnumeration
                        l_1_98 = l_1_98[l_1_27]
                        l_1_98 = l_1_98.Values
                        l_1_98 = l_1_98[l_1_81]
                        l_1_84(l_1_98, (l_1_83) .. l_1_114)
                      elseif l_1_82 == 2 then
                        l_1_84 = sysio
                        l_1_84 = l_1_84.GetRegValueAsString
                        l_1_98 = (sysio.RegOpenKey)(l_1_27)
                        l_1_84 = l_1_84(l_1_98, l_1_81)
                        l_1_83 = l_1_84 or "Value not set"
                        l_1_84 = l_1_9.RegkeyEnumeration
                        l_1_84 = l_1_84[l_1_27]
                        l_1_84 = l_1_84.Values
                        l_1_84[l_1_81], l_1_98 = l_1_98, {}
                        l_1_84 = table
                        l_1_84 = l_1_84.insert
                        l_1_98 = l_1_9.RegkeyEnumeration
                        l_1_98 = l_1_98[l_1_27]
                        l_1_98 = l_1_98.Values
                        l_1_98 = l_1_98[l_1_81]
                        -- DECOMPILER ERROR at PC801: Overwrote pending register: R37 in 'AssignReg'

                        l_1_84(l_1_98, (l_1_83) .. l_1_114)
                      elseif l_1_82 == 3 then
                        l_1_84 = sysio
                        l_1_84 = l_1_84.GetRegValueAsBinary
                        l_1_98 = (sysio.RegOpenKey)(l_1_27)
                        l_1_84 = l_1_84(l_1_98, l_1_81)
                        l_1_83 = l_1_84 or "Value not set"
                        l_1_84 = l_1_9.RegkeyEnumeration
                        l_1_84 = l_1_84[l_1_27]
                        l_1_84 = l_1_84.Values
                        l_1_84[l_1_81], l_1_98 = l_1_98, {}
                        l_1_84 = table
                        l_1_84 = l_1_84.insert
                        l_1_98 = l_1_9.RegkeyEnumeration
                        l_1_98 = l_1_98[l_1_27]
                        l_1_98 = l_1_98.Values
                        l_1_98 = l_1_98[l_1_81]
                        -- DECOMPILER ERROR at PC827: Overwrote pending register: R37 in 'AssignReg'

                        l_1_84(l_1_98, (l_1_83) .. l_1_114)
                      elseif l_1_82 == 4 then
                        l_1_84 = sysio
                        l_1_84 = l_1_84.GetRegValueAsDword
                        l_1_98 = (sysio.RegOpenKey)(l_1_27)
                        l_1_84 = l_1_84(l_1_98, l_1_81)
                        l_1_83 = l_1_84 or "Value not set"
                        l_1_84 = l_1_9.RegkeyEnumeration
                        l_1_84 = l_1_84[l_1_27]
                        l_1_84 = l_1_84.Values
                        l_1_84[l_1_81], l_1_98 = l_1_98, {}
                        l_1_84 = table
                        l_1_84 = l_1_84.insert
                        l_1_98 = l_1_9.RegkeyEnumeration
                        l_1_98 = l_1_98[l_1_27]
                        l_1_98 = l_1_98.Values
                        l_1_98 = l_1_98[l_1_81]
                        -- DECOMPILER ERROR at PC853: Overwrote pending register: R37 in 'AssignReg'

                        l_1_84(l_1_98, (l_1_83) .. l_1_114)
                      elseif l_1_82 == 7 then
                        l_1_84 = sysio
                        l_1_84 = l_1_84.GetRegValueAsMultiString
                        l_1_98 = (sysio.RegOpenKey)(l_1_27)
                        l_1_84 = l_1_84(l_1_98, l_1_81)
                        l_1_83 = l_1_84 or "Value not set"
                        l_1_84 = l_1_9.RegkeyEnumeration
                        l_1_84 = l_1_84[l_1_27]
                        l_1_84 = l_1_84.Values
                        l_1_84[l_1_81], l_1_98 = l_1_98, {}
                        l_1_84 = ipairs
                        l_1_98 = l_1_83
                        l_1_84 = l_1_84(l_1_98)
                        for l_1_114,l_1_115 in l_1_84 do
                          local l_1_131, l_1_132, l_1_133, l_1_134, l_1_135 = nil
                          l_1_116 = table
                          l_1_116 = l_1_116.insert
                          l_1_117 = l_1_9.RegkeyEnumeration
                          l_1_117 = l_1_117[l_1_27]
                          l_1_117 = l_1_117.Values
                          l_1_117 = l_1_117[l_1_81]
                          l_1_118 = l_1_115
                          l_1_119 = " (REG_MULTI_SZ)"
                          l_1_118 = l_1_118 .. l_1_119
                          l_1_116(l_1_117, l_1_118)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_1_27), l_1_81) then
                          l_1_83 = l_1_82 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC903: Confused about usage of register: R34 in 'UnsetPending'

                        ;
                        (((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_81] = {}
                        -- DECOMPILER ERROR at PC911: Overwrote pending register: R37 in 'AssignReg'

                        ;
                        (table.insert)((((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_81], (l_1_83) .. l_1_114)
                      end
                      l_1_83 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_1_27), l_1_81) or "Value not set"
                      -- DECOMPILER ERROR at PC927: Confused about usage of register: R34 in 'UnsetPending'

                      ;
                      (((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_81] = {}
                      ;
                      (table.insert)((((l_1_9.RegkeyEnumeration)[l_1_27]).Values)[l_1_81], (l_1_83) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_1_136 = nil
                local l_1_137 = nil
                local l_1_138 = nil
                ;
                (table.insert)(l_1_9.Processed, {enumerateregistrykey = l_1_27})
              end
            end
            -- DECOMPILER ERROR at PC948: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          end
          l_1_27 = l_1_18.deleteregistryvalue
          if l_1_27 then
            l_1_27 = ""
            l_1_28 = l_1_18.deleteregistryvalue
            l_1_67 = split
            l_1_67 = l_1_67(l_1_28, ",")
            local l_1_139 = nil
            for l_1_143,l_1_144 in ipairs(l_1_67) do
              local l_1_140, l_1_141, l_1_142, l_1_143, l_1_144 = nil
              l_1_73 = string
              l_1_73 = l_1_73.lower
              -- DECOMPILER ERROR at PC965: Confused about usage of register: R22 in 'UnsetPending'

              l_1_73 = l_1_73((MpCommon.Base64Decode)(l_1_72))
              local l_1_145 = nil
              if l_1_27 ~= nil then
                l_1_27 = explode(l_1_73, "|")
                if #l_1_27 == 2 then
                  local l_1_146 = nil
                  local l_1_147 = nil
                  -- DECOMPILER ERROR at PC982: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC985: Confused about usage of register: R24 in 'UnsetPending'

                  local l_1_148 = nil
                  if (sysio.RegOpenKey)(l_1_27[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC996: Confused about usage of register: R24 in 'UnsetPending'

                    local l_1_149 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_1_2, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]), l_1_82, l_1_83, 500, 1)
                    -- DECOMPILER ERROR at PC1013: Overwrote pending register: R32 in 'AssignReg'

                    local l_1_150, l_1_151 = nil
                    -- DECOMPILER ERROR at PC1018: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1018: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_1_82)
                    -- DECOMPILER ERROR at PC1022: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1023: Overwrote pending register: R33 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_1_82, l_1_83, 1, l_1_6, 500, 1)
                    -- DECOMPILER ERROR at PC1032: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1033: Overwrote pending register: R33 in 'AssignReg'

                    local l_1_152, l_1_153 = nil
                    -- DECOMPILER ERROR at PC1036: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1037: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1038: Overwrote pending register: R33 in 'AssignReg'

                    l_1_82(l_1_83, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2]))
                  else
                    -- DECOMPILER ERROR at PC1043: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1043: Confused about usage of register: R27 in 'UnsetPending'

                  end
                  local l_1_154 = nil
                  -- DECOMPILER ERROR at PC1046: Overwrote pending register: R28 in 'AssignReg'

                  local l_1_155 = nil
                  local l_1_156 = nil
                  -- DECOMPILER ERROR at PC1048: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1048: Overwrote pending register: R30 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1050: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1050: Overwrote pending register: R32 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_1_2, l_1_82), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_1_82, l_1_83, (string.format)("%s\\\\%s", l_1_27[1], l_1_27[2])) .. " " .. l_1_82})
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
              l_1_67 = "%windir%"
              l_1_28 = l_1_28(l_1_67)
              l_1_67 = l_1_28
              l_1_67 = l_1_67 .. "\\system32\\"
              local l_1_157 = nil
              local l_1_158 = nil
              if #(sysio.GetProcessFromFileName)(l_1_67 .. "svchost.exe") > 0 then
                l_1_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_1_67 .. "svchost.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_1_67 .. "svchost.exe"))[1]).starttime)
              end
            end
            l_1_28 = table
            l_1_28 = l_1_28.insert
            l_1_67 = l_1_9.Processed
            local l_1_159 = nil
            local l_1_160 = nil
            l_1_28(l_1_67, {process = l_1_18.process})
            l_1_28 = MpCommon
            l_1_28 = l_1_28.BmTriggerSig
            l_1_67 = l_1_27
            l_1_28(l_1_67, "Heimdall_ProcessDispatch", l_1_18.process)
          end
          l_1_27 = l_1_18.firewall
          if l_1_27 then
            l_1_27 = l_1_18.firewall
            l_1_28 = split
            l_1_67 = l_1_27
            l_1_28 = l_1_28(l_1_67, ",")
            l_1_67 = ipairs
            l_1_67 = l_1_67(l_1_28)
            for l_1_164,l_1_165 in l_1_67 do
              local l_1_161, l_1_162, l_1_163, l_1_164, l_1_165 = nil
              -- DECOMPILER ERROR at PC1118: Confused about usage of register: R21 in 'UnsetPending'

              local l_1_166 = nil
              -- DECOMPILER ERROR at PC1122: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1123: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_1_73) then
                local l_1_167 = nil
                local l_1_168 = nil
                local l_1_169 = nil
                l_1_73(l_1_9.Processed, {firewall = (MpCommon.Base64Decode)(l_1_73)})
                -- DECOMPILER ERROR at PC1128: Overwrote pending register: R23 in 'AssignReg'

                l_1_73 = l_1_73((MpCommon.Base64Decode)(l_1_73), "_")
                l_1_73 = #l_1_73
                if l_1_73 == 3 then
                  l_1_73 = tonumber
                  -- DECOMPILER ERROR at PC1137: Confused about usage of register: R22 in 'UnsetPending'

                  l_1_73 = l_1_73(l_1_73[2])
                  -- DECOMPILER ERROR at PC1141: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1142: Confused about usage of register: R22 in 'UnsetPending'

                  local l_1_170 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_1_73[1], l_1_73[3], (mp.bitand)(l_1_73, 2) == 2, (mp.bitand)(l_1_73, 1) == 1)
                end
              end
            end
          end
          l_1_27 = l_1_18.sinkholedns
          if l_1_27 then
            l_1_27 = l_1_18.sinkholedns
            l_1_28 = split
            l_1_28 = l_1_28(l_1_27, ",")
            for l_1_179,l_1_180 in ipairs(l_1_28) do
              local l_1_176, l_1_177, l_1_178, l_1_179, l_1_180 = nil
              -- DECOMPILER ERROR at PC1178: Confused about usage of register: R21 in 'UnsetPending'

              local l_1_181 = nil
              -- DECOMPILER ERROR at PC1180: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1181: Overwrote pending register: R23 in 'AssignReg'

              local l_1_182 = nil
              local l_1_183 = nil
              local l_1_184 = nil
              l_1_73(l_1_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_1_73)})
              -- DECOMPILER ERROR at PC1188: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_1_73) then
                l_1_73 = l_1_73((MpCommon.Base64Decode)(l_1_73), "_")
                -- DECOMPILER ERROR at PC1194: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC1196: Confused about usage of register: R22 in 'UnsetPending'

                l_1_73 = l_1_73(l_1_73[1], l_1_73[2])
                -- DECOMPILER ERROR at PC1200: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1202: Confused about usage of register: R22 in 'UnsetPending'

                local l_1_185 = nil
                l_1_9["sinkholedns" .. "_" .. l_1_73[1] .. "_" .. l_1_73[2]] = {res = l_1_73, isAllowed = l_1_73[1]}
              end
            end
          end
          l_1_27 = l_1_18.dnscache
          if l_1_27 then
            l_1_27 = l_1_18.dnscache
            l_1_28 = split
            l_1_28 = l_1_28(l_1_27, ",")
            for l_1_189,l_1_190 in ipairs(l_1_28) do
              local l_1_186, l_1_187, l_1_188, l_1_189, l_1_190 = nil
              -- DECOMPILER ERROR at PC1224: Confused about usage of register: R21 in 'UnsetPending'

              local l_1_191 = nil
              -- DECOMPILER ERROR at PC1226: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1227: Overwrote pending register: R23 in 'AssignReg'

              local l_1_192 = nil
              local l_1_193 = nil
              local l_1_194 = nil
              l_1_73(l_1_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_1_73)})
              -- DECOMPILER ERROR at PC1234: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_1_73) then
                l_1_73 = l_1_73((MpCommon.Base64Decode)(l_1_73), "_")
                for i_1,i_2 in ipairs(l_1_73) do
                  local l_1_195, l_1_196, l_1_197 = nil
                  l_1_9["dnscache" .. "_" .. i_2], l_1_73 = l_1_73, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_1_27 = l_1_18.debug
          if l_1_27 then
            l_1_27 = l_1_18.debug
            l_1_28 = split
            l_1_28 = l_1_28(l_1_27, ",")
            local l_1_198 = nil
            for l_1_202,l_1_203 in ipairs(l_1_28) do
              local l_1_199, l_1_200, l_1_201, l_1_202, l_1_203 = nil
              l_1_73 = MpCommon
              l_1_73 = l_1_73.Base64Decode
              -- DECOMPILER ERROR at PC1273: Confused about usage of register: R22 in 'UnsetPending'

              l_1_73 = l_1_73(l_1_73)
              local l_1_204 = nil
              local l_1_205 = nil
              local l_1_206 = nil
              local l_1_207 = nil
              ;
              (table.insert)(l_1_9.Processed, {debug = l_1_73})
              for l_1_211,l_1_212 in ipairs((split(l_1_73, "_"))) do
                local l_1_208, l_1_209, l_1_210, l_1_211, l_1_212 = nil
                -- DECOMPILER ERROR at PC1290: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1291: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1291: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1295: Overwrote pending register: R25 in 'AssignReg'

                -- DECOMPILER ERROR at PC1296: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1296: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1299: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1299: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1300: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1302: Overwrote pending register: R32 in 'AssignReg'

                if nil == "PC" then
                  local l_1_213 = nil
                  -- DECOMPILER ERROR at PC1303: Overwrote pending register: R33 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1307: Confused about usage of register: R26 in 'UnsetPending'

                  l_1_83 = l_1_83(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1312: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1314: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1314: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PCNP" then
                    l_1_83 = ":"
                    -- DECOMPILER ERROR at PC1316: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1317: Overwrote pending register: R32 in 'AssignReg'

                    local l_1_214 = nil
                    l_1_83 = table_pack
                    -- DECOMPILER ERROR at PC1322: Confused about usage of register: R26 in 'UnsetPending'

                    l_1_83 = l_1_83(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1327: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1329: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1329: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "RQ" then
                      l_1_83 = ":"
                      -- DECOMPILER ERROR at PC1331: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1332: Overwrote pending register: R32 in 'AssignReg'

                      local l_1_215 = nil
                      l_1_83 = table_pack
                      -- DECOMPILER ERROR at PC1337: Confused about usage of register: R26 in 'UnsetPending'

                      l_1_83 = l_1_83(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1342: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1344: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1344: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "AC" then
                        l_1_83 = ":"
                        -- DECOMPILER ERROR at PC1346: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1347: Overwrote pending register: R32 in 'AssignReg'

                        local l_1_216 = nil
                        l_1_83 = table_pack
                        -- DECOMPILER ERROR at PC1352: Confused about usage of register: R26 in 'UnsetPending'

                        l_1_83 = l_1_83(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_1_9.debug = {[l_1_82] = l_1_83, [l_1_82] = l_1_83, [l_1_82] = l_1_83, [l_1_82] = l_1_83}
          end
          l_1_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_1_10.report = safeJsonSerialize(l_1_9, 260)
          l_1_10.TAG = "NOLOOKUP"
          pcall(mp.GetUrlReputation, l_1_28, l_1_10)
          -- DECOMPILER ERROR at PC1376: Confused about usage of register R37 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


