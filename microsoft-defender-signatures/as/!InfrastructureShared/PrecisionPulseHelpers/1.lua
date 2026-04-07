-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\PrecisionPulseHelpers\1.luac 

-- params : ...
-- function num : 0
CollectFile = function(l_1_0, l_1_1)
  -- function num : 0_0
  l_1_1 = l_1_1 ~= nil or (sysio.GetFileSize)(l_1_0) or 0
  local l_1_2 = 2086912
  local l_1_3 = nil
  if l_1_2 < l_1_1 then
    l_1_3 = (sysio.ReadFile)(l_1_0, 0, l_1_2)
  else
    l_1_3 = (sysio.ReadFile)(l_1_0, 0, l_1_1)
  end
  local l_1_4 = (sysio.GetLastResult)()
  if not l_1_4.Success then
    return nil, l_1_4.Facility, l_1_4.Code
  end
  local l_1_5, l_1_6, l_1_7, l_1_8 = nil, nil, nil, nil
  if l_1_2 < l_1_1 then
    l_1_7 = (crypto.Sha1Buffer)(l_1_3, 0, #l_1_3)
    l_1_8 = (crypto.Sha256Buffer)(l_1_3, 0, #l_1_3)
  else
    l_1_5 = (crypto.Sha1Buffer)(l_1_3, 0, #l_1_3)
    l_1_6 = (crypto.Sha256Buffer)(l_1_3, 0, #l_1_3)
  end
  if l_1_3 then
    l_1_3 = (MpCommon.GzipCompress)(l_1_3)
    l_1_3 = (MpCommon.Base64Encode)(l_1_3)
    return l_1_3, l_1_5, l_1_6, l_1_7, l_1_8
  end
  return 
end

EnablePrecisionPulse = function(l_2_0, l_2_1, l_2_2, l_2_3, l_2_4)
  -- function num : 0_1
  local l_2_5 = 60
  local l_2_6 = 300
  local l_2_7 = nil
  local l_2_8 = 500
  local l_2_9 = {}
  l_2_9.Processed = {}
  l_2_9.FolderEnumeration = {}
  l_2_9.ScanPath = {}
  l_2_9.FullFilePathScan = {}
  l_2_9.RegkeyEnumeration = {}
  l_2_9.DeleteRegValue = {}
  local l_2_10 = {}
  l_2_10.SIG_CONTEXT = "LUA_GENERIC"
  l_2_10.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_2_10.TAG = "NOLOOKUP"
  local l_2_11 = {}
  for l_2_15 in l_2_0:gmatch("[^%+][^%+]+") do
    local l_2_16, l_2_17 = l_2_15:match("(.+)::(.+)")
    if l_2_16 and l_2_17 then
      l_2_11[l_2_16] = l_2_17
    end
  end
  local l_2_18 = {}
  local l_2_19 = l_2_11
  for l_2_23,l_2_24 in pairs(l_2_19) do
    local l_2_25 = l_2_23
    l_2_18[l_2_25] = l_2_24
  end
  if l_2_18.tracking_id then
    l_2_7 = l_2_18.tracking_id
  end
  if l_2_7 == nil then
    l_2_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_2_26 = table.insert
  local l_2_27 = l_2_9.Processed
  local l_2_28 = {}
  l_2_28.TrackingId = l_2_7
  l_2_26(l_2_27, l_2_28)
  l_2_26 = l_2_18.ttl
  if l_2_26 then
    l_2_6 = l_2_18.ttl
    l_2_26 = table
    l_2_26 = l_2_26.insert
    l_2_27 = l_2_9.Processed
    l_2_26(l_2_27, l_2_28)
    l_2_28 = {Ttl = l_2_6}
  end
  l_2_26 = l_2_18.suppress_ttl
  if l_2_26 then
    l_2_5 = l_2_18.suppress_ttl
    l_2_26 = table
    l_2_26 = l_2_26.insert
    l_2_27 = l_2_9.Processed
    l_2_26(l_2_27, l_2_28)
    l_2_28 = {suppress_ttl = l_2_5}
  end
  l_2_26 = MpCommon
  l_2_26 = l_2_26.AtomicCounterValueNamespaced
  l_2_27 = l_2_3
  l_2_28 = l_2_2
  l_2_26 = l_2_26(l_2_27, l_2_28)
  if l_2_26 == nil then
    l_2_27 = MpCommon
    l_2_27 = l_2_27.AtomicCounterSetNamespaced
    l_2_28 = l_2_3
    l_2_27(l_2_28, l_2_2, 0, l_2_5)
  end
  l_2_27 = l_2_18.maxscan
  if l_2_27 then
    l_2_27 = tonumber
    l_2_28 = l_2_18.maxscan
    l_2_27 = l_2_27(l_2_28)
    l_2_8 = l_2_27 or 500
    l_2_27 = MpCommon
    l_2_27 = l_2_27.AtomicCounterValueNamespaced
    l_2_28 = l_2_4
    l_2_27 = l_2_27(l_2_28, l_2_2)
    if l_2_27 == nil then
      l_2_28 = MpCommon
      l_2_28 = l_2_28.AtomicCounterSetNamespaced
      l_2_28(l_2_4, l_2_2, l_2_8, l_2_6)
    else
      l_2_28 = MpCommon
      l_2_28 = l_2_28.AtomicCounterSubNamespaced
      l_2_28(l_2_4, l_2_2, l_2_27)
      l_2_28 = MpCommon
      l_2_28 = l_2_28.AtomicCounterAddNamespaced
      l_2_28(l_2_4, l_2_2, l_2_8)
    end
    l_2_28 = table
    l_2_28 = l_2_28.insert
    local l_2_29 = l_2_9.Processed
    local l_2_30 = {}
    l_2_30.max_scan = l_2_8
    l_2_28(l_2_29, l_2_30)
  end
  do
    l_2_27 = l_2_18.scanpath
    if l_2_27 then
      l_2_27 = l_2_18.scanpath
      l_2_28 = split
      l_2_28 = l_2_28(l_2_27, ",")
      for l_2_34,l_2_35 in ipairs(l_2_28) do
        local l_2_36 = (string.lower)((MpCommon.Base64Decode)(l_2_35))
        local l_2_37 = table.insert
        local l_2_38 = l_2_9.Processed
        local l_2_39 = {}
        l_2_39.scanpath = l_2_36
        l_2_37(l_2_38, l_2_39)
        l_2_37 = AppendToRollingQueueNamespaced
        l_2_38 = "hmdprecisionpulsefolderscan"
        l_2_39 = l_2_2
        l_2_37(l_2_38, l_2_39, l_2_36, 1, l_2_6, 500, 1)
        l_2_37 = mp
        l_2_37 = l_2_37.TriggerScanResource
        l_2_38 = "folder"
        l_2_39 = l_2_36
        l_2_37(l_2_38, l_2_39, 0, 5000)
        l_2_37 = l_2_9.ScanPath
        l_2_37[l_2_36], l_2_38 = l_2_38, {}
        l_2_37 = table
        l_2_37 = l_2_37.insert
        l_2_38 = l_2_9.Processed
        l_2_37(l_2_38, l_2_39)
        l_2_39 = {scanpath = l_2_36}
        l_2_37 = sysio
        l_2_37 = l_2_37.IsFolderExists
        l_2_38 = l_2_36
        l_2_37 = l_2_37(l_2_38)
        if l_2_37 then
          l_2_38 = l_2_9.ScanPath
          l_2_38 = l_2_38[l_2_36]
          l_2_38.Exists = true
          l_2_38 = l_2_9.ScanPath
          l_2_38 = l_2_38[l_2_36]
          l_2_39 = sysio
          l_2_39 = l_2_39.IsPathAVExcluded
          l_2_39 = l_2_39(l_2_36, true)
          l_2_38.Excluded = l_2_39
        else
          l_2_38 = l_2_9.ScanPath
          l_2_38 = l_2_38[l_2_36]
          l_2_38.Exists = false
        end
      end
    end
    do
      l_2_27 = l_2_18.fullfilepathscan
      if l_2_27 then
        l_2_27 = l_2_18.fullfilepathscan
        l_2_28 = split
        l_2_28 = l_2_28(l_2_27, ",")
        for l_2_43,l_2_44 in ipairs(l_2_28) do
          local l_2_45 = (string.lower)((MpCommon.Base64Decode)(l_2_44))
          local l_2_46 = (sysio.IsFileExists)(l_2_45)
          local l_2_47 = table.insert
          local l_2_48 = l_2_9.Processed
          local l_2_49 = {}
          l_2_49.fullfilepathscan = l_2_45
          l_2_47(l_2_48, l_2_49)
          l_2_47 = l_2_9.FullFilePathScan
          l_2_47[l_2_45], l_2_48 = l_2_48, {}
          l_2_47 = true
          if l_2_46 then
            l_2_48 = string
            l_2_48 = l_2_48.match
            l_2_49 = l_2_45
            l_2_48 = l_2_48(l_2_49, "(.-)[\\/][^\\/]*$")
            l_2_49 = l_2_9.FullFilePathScan
            l_2_49 = l_2_49[l_2_45]
            l_2_49.Exists = true
            l_2_49 = pcall
            l_2_49 = l_2_49(IsAVExcluded, l_2_48)
            do
              if IsAVExcluded == nil then
                local l_2_50, l_2_51, l_2_52 = false
              end
              -- DECOMPILER ERROR at PC266: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_2_9.FullFilePathScan)[l_2_45]).Excluded = (sysio.IsPathAVExcluded)(l_2_48, true)
              -- DECOMPILER ERROR at PC269: Confused about usage of register: R27 in 'UnsetPending'

              -- DECOMPILER ERROR at PC269: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_2_9.FullFilePathScan)[l_2_45]).Excluded_LUA_API = l_2_50
              -- DECOMPILER ERROR at PC275: Confused about usage of register: R27 in 'UnsetPending'

              if ((l_2_9.FullFilePathScan)[l_2_45]).Excluded == true and l_2_50 == true then
                l_2_47 = false
              end
              l_2_47 = false
              l_2_48 = l_2_9.FullFilePathScan
              l_2_48 = l_2_48[l_2_45]
              l_2_48.Exists = false
              l_2_48 = pcallEx
              l_2_49 = "AppendToRollingQueueNamespaced"
              l_2_48 = l_2_48(l_2_49, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_2_2, l_2_45, 1, l_2_6, 500, 1)
              do
                if not l_2_48 then
                  local l_2_53 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC312: Confused about usage of register: R28 in 'UnsetPending'

                  if l_2_53 and type(l_2_53) == "table" then
                    ((l_2_9.FullFilePathScan)[l_2_45]).RQErrors = safeJsonSerialize(l_2_53, 260)
                  end
                end
                if l_2_47 then
                  (mp.TriggerScanResource)("file", l_2_45, 0, 10000)
                  local l_2_54 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_2_54 then
                    local l_2_55 = l_2_54 .. "\\system32\\"
                    local l_2_56 = (sysio.GetProcessFromFileName)(l_2_55 .. "svchost.exe")
                    if #l_2_56 > 0 then
                      local l_2_57 = (string.format)("pid:%d,ProcessStart:%u", (l_2_56[1]).pid, (l_2_56[1]).starttime)
                      if l_2_57 then
                        (MpCommon.BmTriggerSig)(l_2_57, "hmdprecisionpulsefullfilepathscan_statuscheck", l_2_45)
                      end
                    end
                  end
                else
                  do
                    local l_2_58 = (sysio.GetFileSize)(l_2_45)
                    local l_2_59 = (sysio.GetFileLastWriteTime)(l_2_45)
                    local l_2_60 = table.insert
                    local l_2_61 = ((l_2_9.FullFilePathScan)[l_2_45]).ExcludedFileInfo
                    local l_2_62 = {}
                    l_2_62.Size = l_2_58
                    l_2_62.LastModified = l_2_59
                    l_2_60(l_2_61, l_2_62)
                    l_2_60 = pcall
                    l_2_61 = CollectFile
                    l_2_62 = l_2_45
                    l_2_60 = l_2_60(l_2_61, l_2_62, l_2_58)
                    do
                      local l_2_63, l_2_64, l_2_65 = nil
                      -- DECOMPILER ERROR at PC385: Confused about usage of register: R35 in 'UnsetPending'

                      if l_2_60 then
                        if l_2_61 then
                          ((l_2_9.FullFilePathScan)[l_2_45]).Content = l_2_61
                          -- DECOMPILER ERROR at PC388: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_2_9.FullFilePathScan)[l_2_45]).Sha1 = l_2_62
                          -- DECOMPILER ERROR at PC391: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_2_9.FullFilePathScan)[l_2_45]).Sha256 = l_2_63
                          -- DECOMPILER ERROR at PC394: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_2_9.FullFilePathScan)[l_2_45]).PartialSha1 = l_2_64
                          -- DECOMPILER ERROR at PC397: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_2_9.FullFilePathScan)[l_2_45]).PartialSha256 = l_2_65
                        else
                          -- DECOMPILER ERROR at PC401: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_2_9.FullFilePathScan)[l_2_45]).Error_Facility = l_2_62
                          -- DECOMPILER ERROR at PC404: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_2_9.FullFilePathScan)[l_2_45]).Error_Code = l_2_63
                        end
                      end
                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC405: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
      l_2_27 = l_2_18.scanfile
      if l_2_27 then
        l_2_27 = l_2_18.scanfile
        l_2_28 = split
        l_2_28 = l_2_28(l_2_27, ",")
        for l_2_69,l_2_70 in ipairs(l_2_28) do
          local l_2_71 = (string.lower)((MpCommon.Base64Decode)(l_2_70))
          local l_2_72 = table.insert
          local l_2_73 = l_2_9.Processed
          local l_2_74 = {}
          l_2_74.scanfile = l_2_71
          l_2_72(l_2_73, l_2_74)
          l_2_72 = AppendToRollingQueueNamespaced
          l_2_73 = "hmdprecisionpulsescanfile"
          l_2_74 = l_2_2
          l_2_72(l_2_73, l_2_74, l_2_71, 1, l_2_6, 500, 1)
        end
      end
      do
        do
          l_2_27 = l_2_18.enumeratefolder
          if l_2_27 then
            l_2_27 = 260
            l_2_28 = ""
            local l_2_75 = "*"
            local l_2_76 = 0
            local l_2_77 = true
            local l_2_78 = false
            local l_2_79 = l_2_18.enumeratefolder
            local l_2_80 = split(l_2_79, ",")
            local l_2_81 = 0
            for l_2_85,l_2_86 in ipairs(l_2_80) do
              l_2_81 = l_2_81 + 1
              -- DECOMPILER ERROR at PC467: Confused about usage of register: R29 in 'UnsetPending'

              if l_2_27 < l_2_81 then
                ((l_2_9.FolderEnumeration)[l_2_28]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_2_87 = (string.lower)((MpCommon.Base64Decode)(l_2_86))
              local l_2_88 = explode(l_2_87, "|")
              if #l_2_88 == 4 then
                l_2_28 = l_2_88[1]
                l_2_75 = l_2_88[2]
                l_2_76 = tonumber(l_2_88[3]) or 0
                l_2_77 = tonumber(l_2_88[4]) == 1
              elseif #l_2_88 == 5 then
                l_2_28 = l_2_88[1]
                l_2_75 = l_2_88[2]
                l_2_76 = tonumber(l_2_88[3]) or 0
                l_2_77 = tonumber(l_2_88[4]) == 1
                l_2_78 = tonumber(l_2_88[5]) == 1
              else
                l_2_28 = l_2_88[1]
              end
              if l_2_28 ~= nil then
                local l_2_89 = #l_2_28 + 2
                -- DECOMPILER ERROR at PC532: Confused about usage of register: R32 in 'UnsetPending'

                ;
                (l_2_9.FolderEnumeration)[l_2_28] = {}
                -- DECOMPILER ERROR at PC536: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_2_9.FolderEnumeration)[l_2_28]).Files = {}
                -- DECOMPILER ERROR at PC540: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_2_9.FolderEnumeration)[l_2_28]).Subfolders = {}
                local l_2_90 = (sysio.FindFiles)(l_2_28, l_2_75, l_2_76)
                local l_2_91 = (sysio.FindFolders)(l_2_28, "*", 0)
                if l_2_90 ~= nil then
                  local l_2_92 = 0
                  for l_2_96,l_2_97 in pairs(l_2_90) do
                    l_2_92 = l_2_92 + 1
                    -- DECOMPILER ERROR at PC565: Confused about usage of register: R40 in 'UnsetPending'

                    if l_2_27 < l_2_92 then
                      ((l_2_9.FolderEnumeration)[l_2_28]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC569: Confused about usage of register: R40 in 'UnsetPending'

                      ;
                      ((l_2_9.FolderEnumeration)[l_2_28]).TotalFilesEnumerated = #l_2_90
                      break
                    end
                    local l_2_98 = (string.sub)(l_2_97, l_2_89)
                    if l_2_78 then
                      local l_2_99 = (sysio.GetFileSize)(l_2_97)
                      local l_2_100 = (sysio.GetFileLastWriteTime)(l_2_97)
                      local l_2_101 = table.insert
                      local l_2_102 = ((l_2_9.FolderEnumeration)[l_2_28]).Files
                      local l_2_103 = {}
                      l_2_103.Name = l_2_98
                      l_2_103.Size = l_2_99
                      l_2_103.LastModified = l_2_100
                      l_2_101(l_2_102, l_2_103)
                      l_2_92 = l_2_92 + 1
                    end
                    if l_2_77 then
                      local l_2_104 = l_2_8
                      local l_2_105 = (MpCommon.AtomicCounterAddNamespaced)(l_2_3, l_2_2, 1)
                      -- DECOMPILER ERROR at PC610: Confused about usage of register: R43 in 'UnsetPending'

                      if l_2_104 <= l_2_105 then
                        ((l_2_9.FolderEnumeration)[l_2_28]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_2_2, (string.lower)(l_2_97), 1, l_2_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_2_97), 0, 5000)
                      end
                    end
                  end
                end
                l_2_92 = table
                l_2_92 = l_2_92.insert
                local l_2_106 = nil
                l_2_106 = l_2_9.Processed
                local l_2_107 = nil
                local l_2_108 = nil
                l_2_92(l_2_106, l_2_107)
                l_2_107 = {enumeratefolder = l_2_28}
                l_2_92 = sysio
                l_2_92 = l_2_92.IsFolderExists
                l_2_106 = l_2_28
                l_2_92 = l_2_92(l_2_106)
                if l_2_92 then
                  l_2_106 = l_2_9.FolderEnumeration
                  l_2_106 = l_2_106[l_2_28]
                  l_2_106.Exists = true
                  l_2_106 = l_2_9.FolderEnumeration
                  l_2_106 = l_2_106[l_2_28]
                  l_2_107 = sysio
                  l_2_107 = l_2_107.IsPathAVExcluded
                  l_2_108 = l_2_28
                  l_2_107 = l_2_107(l_2_108, true)
                  l_2_106.Excluded = l_2_107
                else
                  l_2_106 = l_2_9.FolderEnumeration
                  l_2_106 = l_2_106[l_2_28]
                  l_2_106.Exists = false
                end
                if l_2_78 == false then
                  l_2_106 = #l_2_90
                  if l_2_106 <= l_2_27 then
                    l_2_106 = table
                    l_2_106 = l_2_106.insert
                    l_2_107 = l_2_9.FolderEnumeration
                    l_2_107 = l_2_107[l_2_28]
                    local l_2_109 = nil
                    l_2_106(l_2_107, l_2_108)
                    l_2_108 = {Files = l_2_90}
                  else
                    l_2_107 = 1
                    l_2_108 = l_2_27
                    for i = l_2_107, l_2_108 do
                      local l_2_112 = nil
                      l_2_112 = l_2_90[l_2_111]
                    end
                    local l_2_113 = nil
                    local l_2_114 = nil
                    local l_2_115 = nil
                    ;
                    (table.insert)((l_2_9.FolderEnumeration)[l_2_28], l_2_113)
                    l_2_113 = {Files = l_2_106}
                    -- DECOMPILER ERROR at PC694: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_2_9.FolderEnumeration)[l_2_28]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC698: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_2_9.FolderEnumeration)[l_2_28]).TotalFilesEnumerated = #l_2_90
                  end
                end
                -- DECOMPILER ERROR at PC701: Overwrote pending register: R35 in 'AssignReg'

                if l_2_91 ~= nil then
                  for l_2_119,l_2_120 in pairs(l_2_91) do
                    local l_2_119, l_2_120 = nil
                    -- DECOMPILER ERROR at PC706: Overwrote pending register: R35 in 'AssignReg'

                    if l_2_27 < l_2_106 then
                      break
                    end
                    l_2_119 = string
                    l_2_119 = l_2_119.sub
                    l_2_120 = l_2_118
                    l_2_119 = l_2_119(l_2_120, l_2_89)
                    local l_2_121 = nil
                    l_2_120 = table
                    l_2_120 = l_2_120.insert
                    l_2_121 = l_2_9.FolderEnumeration
                    l_2_121 = l_2_121[l_2_28]
                    l_2_121 = l_2_121.Subfolders
                    l_2_120(l_2_121, l_2_119)
                  end
                end
                -- DECOMPILER ERROR at PC724: Overwrote pending register: R35 in 'AssignReg'

                l_2_106("hmdprecisionpulseenumeratefolder", l_2_2, l_2_28, 1, l_2_6, 500, 1)
                -- DECOMPILER ERROR at PC733: Confused about usage of register R37 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_2_27 = l_2_18.enumerateregistrykey
          if l_2_27 then
            l_2_27 = ""
            l_2_28 = l_2_18.enumerateregistrykey
            l_2_75 = split
            l_2_76 = l_2_28
            l_2_77 = ","
            l_2_75 = l_2_75(l_2_76, l_2_77)
            local l_2_122 = nil
            l_2_76 = ipairs
            l_2_77 = l_2_75
            l_2_76 = l_2_76(l_2_77)
            for l_2_79,l_2_80 in l_2_76 do
              local l_2_123, l_2_124, l_2_125, l_2_126, l_2_127 = nil
              l_2_81 = string
              l_2_81 = l_2_81.lower
              l_2_81 = l_2_81((MpCommon.Base64Decode)(l_2_80))
              local l_2_128 = nil
              l_2_27 = l_2_81
              if l_2_27 ~= nil then
                local l_2_129 = nil
                -- DECOMPILER ERROR at PC764: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC768: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC772: Confused about usage of register: R25 in 'UnsetPending'

                local l_2_130 = nil
                local l_2_131 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_2_27)) ~= nil then
                  (table.insert)(((l_2_9.RegkeyEnumeration)[l_2_27]).Keys, l_2_87)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_2_27)) ~= nil then
                    for l_2_88,l_2_89 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_2_27))) do
                      local l_2_132, l_2_133, l_2_134, l_2_135, l_2_136 = nil
                      l_2_90 = sysio
                      l_2_90 = l_2_90.GetRegValueType
                      l_2_91 = (sysio.RegOpenKey)(l_2_27)
                      l_2_92 = l_2_89
                      l_2_90 = (l_2_90(l_2_91, l_2_92))
                      local l_2_137 = nil
                      l_2_91 = nil
                      local l_2_138 = nil
                      if l_2_90 == 1 then
                        l_2_92 = sysio
                        l_2_92 = l_2_92.GetRegValueAsString
                        -- DECOMPILER ERROR at PC806: Overwrote pending register: R35 in 'AssignReg'

                        l_2_92 = l_2_92(l_2_106, l_2_89)
                        l_2_91 = l_2_92 or "Value not set"
                        l_2_92 = l_2_9.RegkeyEnumeration
                        l_2_92 = l_2_92[l_2_27]
                        l_2_92 = l_2_92.Values
                        l_2_92[l_2_89], l_2_106 = l_2_106, {}
                        l_2_92 = table
                        l_2_92 = l_2_92.insert
                        l_2_106 = l_2_9.RegkeyEnumeration
                        l_2_106 = l_2_106[l_2_27]
                        l_2_106 = l_2_106.Values
                        l_2_106 = l_2_106[l_2_89]
                        l_2_92(l_2_106, (l_2_91) .. l_2_122)
                      elseif l_2_90 == 2 then
                        l_2_92 = sysio
                        l_2_92 = l_2_92.GetRegValueAsString
                        l_2_106 = (sysio.RegOpenKey)(l_2_27)
                        l_2_92 = l_2_92(l_2_106, l_2_89)
                        l_2_91 = l_2_92 or "Value not set"
                        l_2_92 = l_2_9.RegkeyEnumeration
                        l_2_92 = l_2_92[l_2_27]
                        l_2_92 = l_2_92.Values
                        l_2_92[l_2_89], l_2_106 = l_2_106, {}
                        l_2_92 = table
                        l_2_92 = l_2_92.insert
                        l_2_106 = l_2_9.RegkeyEnumeration
                        l_2_106 = l_2_106[l_2_27]
                        l_2_106 = l_2_106.Values
                        l_2_106 = l_2_106[l_2_89]
                        -- DECOMPILER ERROR at PC850: Overwrote pending register: R37 in 'AssignReg'

                        l_2_92(l_2_106, (l_2_91) .. l_2_122)
                      elseif l_2_90 == 3 then
                        l_2_92 = sysio
                        l_2_92 = l_2_92.GetRegValueAsBinary
                        l_2_106 = (sysio.RegOpenKey)(l_2_27)
                        l_2_92 = l_2_92(l_2_106, l_2_89)
                        l_2_91 = l_2_92 or "Value not set"
                        l_2_92 = l_2_9.RegkeyEnumeration
                        l_2_92 = l_2_92[l_2_27]
                        l_2_92 = l_2_92.Values
                        l_2_92[l_2_89], l_2_106 = l_2_106, {}
                        l_2_92 = table
                        l_2_92 = l_2_92.insert
                        l_2_106 = l_2_9.RegkeyEnumeration
                        l_2_106 = l_2_106[l_2_27]
                        l_2_106 = l_2_106.Values
                        l_2_106 = l_2_106[l_2_89]
                        -- DECOMPILER ERROR at PC876: Overwrote pending register: R37 in 'AssignReg'

                        l_2_92(l_2_106, (l_2_91) .. l_2_122)
                      elseif l_2_90 == 4 then
                        l_2_92 = sysio
                        l_2_92 = l_2_92.GetRegValueAsDword
                        l_2_106 = (sysio.RegOpenKey)(l_2_27)
                        l_2_92 = l_2_92(l_2_106, l_2_89)
                        l_2_91 = l_2_92 or "Value not set"
                        l_2_92 = l_2_9.RegkeyEnumeration
                        l_2_92 = l_2_92[l_2_27]
                        l_2_92 = l_2_92.Values
                        l_2_92[l_2_89], l_2_106 = l_2_106, {}
                        l_2_92 = table
                        l_2_92 = l_2_92.insert
                        l_2_106 = l_2_9.RegkeyEnumeration
                        l_2_106 = l_2_106[l_2_27]
                        l_2_106 = l_2_106.Values
                        l_2_106 = l_2_106[l_2_89]
                        -- DECOMPILER ERROR at PC902: Overwrote pending register: R37 in 'AssignReg'

                        l_2_92(l_2_106, (l_2_91) .. l_2_122)
                      elseif l_2_90 == 7 then
                        l_2_92 = sysio
                        l_2_92 = l_2_92.GetRegValueAsMultiString
                        l_2_106 = (sysio.RegOpenKey)(l_2_27)
                        l_2_92 = l_2_92(l_2_106, l_2_89)
                        l_2_91 = l_2_92 or "Value not set"
                        l_2_92 = l_2_9.RegkeyEnumeration
                        l_2_92 = l_2_92[l_2_27]
                        l_2_92 = l_2_92.Values
                        l_2_92[l_2_89], l_2_106 = l_2_106, {}
                        l_2_92 = ipairs
                        l_2_106 = l_2_91
                        l_2_92 = l_2_92(l_2_106)
                        for l_2_122,l_2_123 in l_2_92 do
                          local l_2_139, l_2_140, l_2_141, l_2_142, l_2_143 = nil
                          l_2_124 = table
                          l_2_124 = l_2_124.insert
                          l_2_125 = l_2_9.RegkeyEnumeration
                          l_2_125 = l_2_125[l_2_27]
                          l_2_125 = l_2_125.Values
                          l_2_125 = l_2_125[l_2_89]
                          l_2_126 = l_2_123
                          l_2_127 = " (REG_MULTI_SZ)"
                          l_2_126 = l_2_126 .. l_2_127
                          l_2_124(l_2_125, l_2_126)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_2_27), l_2_89) then
                          l_2_91 = l_2_90 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC952: Confused about usage of register: R34 in 'UnsetPending'

                        ;
                        (((l_2_9.RegkeyEnumeration)[l_2_27]).Values)[l_2_89] = {}
                        -- DECOMPILER ERROR at PC960: Overwrote pending register: R37 in 'AssignReg'

                        ;
                        (table.insert)((((l_2_9.RegkeyEnumeration)[l_2_27]).Values)[l_2_89], (l_2_91) .. l_2_122)
                      end
                      l_2_91 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_2_27), l_2_89) or "Value not set"
                      -- DECOMPILER ERROR at PC976: Confused about usage of register: R34 in 'UnsetPending'

                      ;
                      (((l_2_9.RegkeyEnumeration)[l_2_27]).Values)[l_2_89] = {}
                      ;
                      (table.insert)((((l_2_9.RegkeyEnumeration)[l_2_27]).Values)[l_2_89], (l_2_91) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_2_144 = nil
                local l_2_145 = nil
                local l_2_146 = nil
                ;
                (table.insert)(l_2_9.Processed, {enumerateregistrykey = l_2_27})
              end
            end
            -- DECOMPILER ERROR at PC997: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          end
          l_2_27 = l_2_18.deleteregistryvalue
          if l_2_27 then
            l_2_27 = ""
            l_2_28 = l_2_18.deleteregistryvalue
            l_2_75 = split
            l_2_75 = l_2_75(l_2_28, ",")
            local l_2_147 = nil
            for l_2_151,l_2_152 in ipairs(l_2_75) do
              local l_2_148, l_2_149, l_2_150, l_2_151, l_2_152 = nil
              l_2_81 = string
              l_2_81 = l_2_81.lower
              -- DECOMPILER ERROR at PC1014: Confused about usage of register: R22 in 'UnsetPending'

              l_2_81 = l_2_81((MpCommon.Base64Decode)(l_2_80))
              local l_2_153 = nil
              if l_2_27 ~= nil then
                l_2_27 = explode(l_2_81, "|")
                if #l_2_27 == 2 then
                  local l_2_154 = nil
                  local l_2_155 = nil
                  -- DECOMPILER ERROR at PC1031: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1034: Confused about usage of register: R24 in 'UnsetPending'

                  local l_2_156 = nil
                  if (sysio.RegOpenKey)(l_2_27[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1045: Confused about usage of register: R24 in 'UnsetPending'

                    local l_2_157 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_2_2, (string.format)("%s\\\\%s", l_2_27[1], l_2_27[2]), l_2_90, l_2_91, 500, 1)
                    -- DECOMPILER ERROR at PC1062: Overwrote pending register: R32 in 'AssignReg'

                    local l_2_158, l_2_159 = nil
                    -- DECOMPILER ERROR at PC1067: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1067: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_2_90)
                    -- DECOMPILER ERROR at PC1071: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1072: Overwrote pending register: R33 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_2_90, l_2_91, 1, l_2_6, 500, 1)
                    -- DECOMPILER ERROR at PC1081: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1082: Overwrote pending register: R33 in 'AssignReg'

                    local l_2_160, l_2_161 = nil
                    -- DECOMPILER ERROR at PC1085: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1086: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1087: Overwrote pending register: R33 in 'AssignReg'

                    l_2_90(l_2_91, (string.format)("%s\\\\%s", l_2_27[1], l_2_27[2]))
                  else
                    -- DECOMPILER ERROR at PC1092: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1092: Confused about usage of register: R27 in 'UnsetPending'

                  end
                  local l_2_162 = nil
                  -- DECOMPILER ERROR at PC1095: Overwrote pending register: R28 in 'AssignReg'

                  local l_2_163 = nil
                  local l_2_164 = nil
                  -- DECOMPILER ERROR at PC1097: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1097: Overwrote pending register: R30 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1099: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1099: Overwrote pending register: R32 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_2_2, l_2_90), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_2_90, l_2_91, (string.format)("%s\\\\%s", l_2_27[1], l_2_27[2])) .. " " .. l_2_90})
                end
              end
            end
          end
          l_2_27 = l_2_18.process
          if l_2_27 then
            l_2_27 = mp
            l_2_27 = l_2_27.get_contextdata
            l_2_28 = mp
            l_2_28 = l_2_28.CONTEXT_DATA_PROCESS_PPID
            l_2_27 = l_2_27(l_2_28)
            if l_2_27 == nil then
              l_2_28 = MpCommon
              l_2_28 = l_2_28.ExpandEnvironmentVariables
              l_2_75 = "%windir%"
              l_2_28 = l_2_28(l_2_75)
              l_2_75 = l_2_28
              l_2_75 = l_2_75 .. "\\system32\\"
              local l_2_165 = nil
              local l_2_166 = nil
              if #(sysio.GetProcessFromFileName)(l_2_75 .. "svchost.exe") > 0 then
                l_2_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_2_75 .. "svchost.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_2_75 .. "svchost.exe"))[1]).starttime)
              end
            end
            l_2_28 = table
            l_2_28 = l_2_28.insert
            l_2_75 = l_2_9.Processed
            local l_2_167 = nil
            local l_2_168 = nil
            l_2_28(l_2_75, {process = l_2_18.process})
            l_2_28 = MpCommon
            l_2_28 = l_2_28.BmTriggerSig
            l_2_75 = l_2_27
            l_2_28(l_2_75, "Heimdall_ProcessDispatch", l_2_18.process)
          end
          l_2_27 = l_2_18.firewall
          if l_2_27 then
            l_2_27 = l_2_18.firewall
            l_2_28 = split
            l_2_75 = l_2_27
            l_2_28 = l_2_28(l_2_75, ",")
            l_2_75 = ipairs
            l_2_75 = l_2_75(l_2_28)
            for l_2_172,l_2_173 in l_2_75 do
              local l_2_169, l_2_170, l_2_171, l_2_172, l_2_173 = nil
              -- DECOMPILER ERROR at PC1167: Confused about usage of register: R21 in 'UnsetPending'

              local l_2_174 = nil
              -- DECOMPILER ERROR at PC1171: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1172: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_2_81) then
                local l_2_175 = nil
                local l_2_176 = nil
                local l_2_177 = nil
                l_2_81(l_2_9.Processed, {firewall = (MpCommon.Base64Decode)(l_2_81)})
                -- DECOMPILER ERROR at PC1177: Overwrote pending register: R23 in 'AssignReg'

                l_2_81 = l_2_81((MpCommon.Base64Decode)(l_2_81), "_")
                l_2_81 = #l_2_81
                if l_2_81 == 3 then
                  l_2_81 = tonumber
                  -- DECOMPILER ERROR at PC1186: Confused about usage of register: R22 in 'UnsetPending'

                  l_2_81 = l_2_81(l_2_81[2])
                  -- DECOMPILER ERROR at PC1190: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1191: Confused about usage of register: R22 in 'UnsetPending'

                  local l_2_178 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_2_81[1], l_2_81[3], (mp.bitand)(l_2_81, 2) == 2, (mp.bitand)(l_2_81, 1) == 1)
                end
              end
            end
          end
          l_2_27 = l_2_18.sinkholedns
          if l_2_27 then
            l_2_27 = l_2_18.sinkholedns
            l_2_28 = split
            l_2_28 = l_2_28(l_2_27, ",")
            for l_2_187,l_2_188 in ipairs(l_2_28) do
              local l_2_184, l_2_185, l_2_186, l_2_187, l_2_188 = nil
              -- DECOMPILER ERROR at PC1227: Confused about usage of register: R21 in 'UnsetPending'

              local l_2_189 = nil
              -- DECOMPILER ERROR at PC1229: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1230: Overwrote pending register: R23 in 'AssignReg'

              local l_2_190 = nil
              local l_2_191 = nil
              local l_2_192 = nil
              l_2_81(l_2_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_2_81)})
              -- DECOMPILER ERROR at PC1237: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_2_81) then
                l_2_81 = l_2_81((MpCommon.Base64Decode)(l_2_81), "_")
                -- DECOMPILER ERROR at PC1243: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC1245: Confused about usage of register: R22 in 'UnsetPending'

                l_2_81 = l_2_81(l_2_81[1], l_2_81[2])
                -- DECOMPILER ERROR at PC1249: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1251: Confused about usage of register: R22 in 'UnsetPending'

                local l_2_193 = nil
                l_2_9["sinkholedns" .. "_" .. l_2_81[1] .. "_" .. l_2_81[2]] = {res = l_2_81, isAllowed = l_2_81[1]}
              end
            end
          end
          l_2_27 = l_2_18.dnscache
          if l_2_27 then
            l_2_27 = l_2_18.dnscache
            l_2_28 = split
            l_2_28 = l_2_28(l_2_27, ",")
            for l_2_197,l_2_198 in ipairs(l_2_28) do
              local l_2_194, l_2_195, l_2_196, l_2_197, l_2_198 = nil
              -- DECOMPILER ERROR at PC1273: Confused about usage of register: R21 in 'UnsetPending'

              local l_2_199 = nil
              -- DECOMPILER ERROR at PC1275: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1276: Overwrote pending register: R23 in 'AssignReg'

              local l_2_200 = nil
              local l_2_201 = nil
              local l_2_202 = nil
              l_2_81(l_2_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_2_81)})
              -- DECOMPILER ERROR at PC1283: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_2_81) then
                l_2_81 = l_2_81((MpCommon.Base64Decode)(l_2_81), "_")
                for i_1,i_2 in ipairs(l_2_81) do
                  local l_2_203, l_2_204, l_2_205 = nil
                  l_2_9["dnscache" .. "_" .. i_2], l_2_81 = l_2_81, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_2_27 = l_2_18.debug
          if l_2_27 then
            l_2_27 = l_2_18.debug
            l_2_28 = split
            l_2_28 = l_2_28(l_2_27, ",")
            local l_2_206 = nil
            for l_2_210,l_2_211 in ipairs(l_2_28) do
              local l_2_207, l_2_208, l_2_209, l_2_210, l_2_211 = nil
              l_2_81 = MpCommon
              l_2_81 = l_2_81.Base64Decode
              -- DECOMPILER ERROR at PC1322: Confused about usage of register: R22 in 'UnsetPending'

              l_2_81 = l_2_81(l_2_81)
              local l_2_212 = nil
              local l_2_213 = nil
              local l_2_214 = nil
              local l_2_215 = nil
              ;
              (table.insert)(l_2_9.Processed, {debug = l_2_81})
              for l_2_219,l_2_220 in ipairs((split(l_2_81, "_"))) do
                local l_2_216, l_2_217, l_2_218, l_2_219, l_2_220 = nil
                -- DECOMPILER ERROR at PC1339: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1340: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1340: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1344: Overwrote pending register: R25 in 'AssignReg'

                -- DECOMPILER ERROR at PC1345: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1345: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1348: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1348: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1349: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1351: Overwrote pending register: R32 in 'AssignReg'

                if nil == "PC" then
                  local l_2_221 = nil
                  -- DECOMPILER ERROR at PC1352: Overwrote pending register: R33 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1356: Confused about usage of register: R26 in 'UnsetPending'

                  l_2_91 = l_2_91(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1361: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1363: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1363: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PCNP" then
                    l_2_91 = ":"
                    -- DECOMPILER ERROR at PC1365: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1366: Overwrote pending register: R32 in 'AssignReg'

                    local l_2_222 = nil
                    l_2_91 = table_pack
                    -- DECOMPILER ERROR at PC1371: Confused about usage of register: R26 in 'UnsetPending'

                    l_2_91 = l_2_91(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1376: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1378: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1378: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "RQ" then
                      l_2_91 = ":"
                      -- DECOMPILER ERROR at PC1380: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1381: Overwrote pending register: R32 in 'AssignReg'

                      local l_2_223 = nil
                      l_2_91 = table_pack
                      -- DECOMPILER ERROR at PC1386: Confused about usage of register: R26 in 'UnsetPending'

                      l_2_91 = l_2_91(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1391: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1393: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1393: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "AC" then
                        l_2_91 = ":"
                        -- DECOMPILER ERROR at PC1395: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1396: Overwrote pending register: R32 in 'AssignReg'

                        local l_2_224 = nil
                        l_2_91 = table_pack
                        -- DECOMPILER ERROR at PC1401: Confused about usage of register: R26 in 'UnsetPending'

                        l_2_91 = l_2_91(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_2_9.debug = {[l_2_90] = l_2_91, [l_2_90] = l_2_91, [l_2_90] = l_2_91, [l_2_90] = l_2_91}
          end
          l_2_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_2_10.report = safeJsonSerialize(l_2_9, 260)
          l_2_10.TAG = "NOLOOKUP"
          pcall(mp.GetUrlReputation, l_2_28, l_2_10)
          -- DECOMPILER ERROR at PC1425: Confused about usage of register R37 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


