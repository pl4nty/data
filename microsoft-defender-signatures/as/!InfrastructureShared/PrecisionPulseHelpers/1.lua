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

ReportResource = function(l_2_0, l_2_1, l_2_2)
  -- function num : 0_1
  if not l_2_1 or not l_2_0 then
    return 
  end
  local l_2_3 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_2_4 = {}
  l_2_4[1] = l_2_3
  local l_2_5 = {}
  l_2_5.SIG_CONTEXT = "Lua_Custom_Upload_Resource"
  l_2_5.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_2_5.TAG = "NOLOOKUP"
  l_2_5.ResourceName = l_2_0
  l_2_5.ResourceContent = l_2_1
  l_2_5.ResourceInfo = safeJsonSerialize(l_2_2)
  SafeGetUrlReputation(l_2_4, l_2_5, false, 2000)
end

EnablePrecisionPulse = function(l_3_0, l_3_1, l_3_2, l_3_3, l_3_4)
  -- function num : 0_2
  local l_3_5 = 60
  local l_3_6 = 300
  local l_3_7 = nil
  local l_3_8 = 500
  local l_3_9 = {}
  l_3_9.Processed = {}
  l_3_9.FolderEnumeration = {}
  l_3_9.ScanPath = {}
  l_3_9.FullFilePathScan = {}
  l_3_9.RegkeyEnumeration = {}
  l_3_9.DeleteRegValue = {}
  local l_3_10 = {}
  l_3_10.SIG_CONTEXT = "LUA_GENERIC"
  l_3_10.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_3_10.TAG = "NOLOOKUP"
  local l_3_11 = {}
  for l_3_15 in l_3_0:gmatch("[^%+][^%+]+") do
    local l_3_16, l_3_17 = l_3_15:match("(.+)::(.+)")
    if l_3_16 and l_3_17 then
      l_3_11[l_3_16] = l_3_17
    end
  end
  local l_3_18 = {}
  local l_3_19 = l_3_11
  for l_3_23,l_3_24 in pairs(l_3_19) do
    local l_3_25 = l_3_23
    l_3_18[l_3_25] = l_3_24
  end
  if l_3_18.tracking_id then
    l_3_7 = l_3_18.tracking_id
  end
  if l_3_7 == nil then
    l_3_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_3_26 = table.insert
  local l_3_27 = l_3_9.Processed
  local l_3_28 = {}
  l_3_28.TrackingId = l_3_7
  l_3_26(l_3_27, l_3_28)
  l_3_26 = l_3_18.ttl
  if l_3_26 then
    l_3_6 = l_3_18.ttl
    l_3_26 = table
    l_3_26 = l_3_26.insert
    l_3_27 = l_3_9.Processed
    l_3_26(l_3_27, l_3_28)
    l_3_28 = {Ttl = l_3_6}
  end
  l_3_26 = l_3_18.suppress_ttl
  if l_3_26 then
    l_3_5 = l_3_18.suppress_ttl
    l_3_26 = table
    l_3_26 = l_3_26.insert
    l_3_27 = l_3_9.Processed
    l_3_26(l_3_27, l_3_28)
    l_3_28 = {suppress_ttl = l_3_5}
  end
  l_3_26 = MpCommon
  l_3_26 = l_3_26.AtomicCounterValueNamespaced
  l_3_27 = l_3_3
  l_3_28 = l_3_2
  l_3_26 = l_3_26(l_3_27, l_3_28)
  if l_3_26 == nil then
    l_3_27 = MpCommon
    l_3_27 = l_3_27.AtomicCounterSetNamespaced
    l_3_28 = l_3_3
    l_3_27(l_3_28, l_3_2, 0, l_3_5)
  end
  l_3_27 = l_3_18.maxscan
  if l_3_27 then
    l_3_27 = tonumber
    l_3_28 = l_3_18.maxscan
    l_3_27 = l_3_27(l_3_28)
    l_3_8 = l_3_27 or 500
    l_3_27 = MpCommon
    l_3_27 = l_3_27.AtomicCounterValueNamespaced
    l_3_28 = l_3_4
    l_3_27 = l_3_27(l_3_28, l_3_2)
    if l_3_27 == nil then
      l_3_28 = MpCommon
      l_3_28 = l_3_28.AtomicCounterSetNamespaced
      l_3_28(l_3_4, l_3_2, l_3_8, l_3_6)
    else
      l_3_28 = MpCommon
      l_3_28 = l_3_28.AtomicCounterSubNamespaced
      l_3_28(l_3_4, l_3_2, l_3_27)
      l_3_28 = MpCommon
      l_3_28 = l_3_28.AtomicCounterAddNamespaced
      l_3_28(l_3_4, l_3_2, l_3_8)
    end
    l_3_28 = table
    l_3_28 = l_3_28.insert
    local l_3_29 = l_3_9.Processed
    local l_3_30 = {}
    l_3_30.max_scan = l_3_8
    l_3_28(l_3_29, l_3_30)
  end
  do
    l_3_27 = l_3_18.scanpath
    if l_3_27 then
      l_3_27 = l_3_18.scanpath
      l_3_28 = split
      l_3_28 = l_3_28(l_3_27, ",")
      for l_3_34,l_3_35 in ipairs(l_3_28) do
        local l_3_36 = (string.lower)((MpCommon.Base64Decode)(l_3_35))
        local l_3_37 = table.insert
        local l_3_38 = l_3_9.Processed
        local l_3_39 = {}
        l_3_39.scanpath = l_3_36
        l_3_37(l_3_38, l_3_39)
        l_3_37 = AppendToRollingQueueNamespaced
        l_3_38 = "hmdprecisionpulsefolderscan"
        l_3_39 = l_3_2
        l_3_37(l_3_38, l_3_39, l_3_36, 1, l_3_6, 500, 1)
        l_3_37 = mp
        l_3_37 = l_3_37.TriggerScanResource
        l_3_38 = "folder"
        l_3_39 = l_3_36
        l_3_37(l_3_38, l_3_39, 0, 5000)
        l_3_37 = l_3_9.ScanPath
        l_3_37[l_3_36], l_3_38 = l_3_38, {}
        l_3_37 = table
        l_3_37 = l_3_37.insert
        l_3_38 = l_3_9.Processed
        l_3_37(l_3_38, l_3_39)
        l_3_39 = {scanpath = l_3_36}
        l_3_37 = sysio
        l_3_37 = l_3_37.IsFolderExists
        l_3_38 = l_3_36
        l_3_37 = l_3_37(l_3_38)
        if l_3_37 then
          l_3_38 = l_3_9.ScanPath
          l_3_38 = l_3_38[l_3_36]
          l_3_38.Exists = true
          l_3_38 = l_3_9.ScanPath
          l_3_38 = l_3_38[l_3_36]
          l_3_39 = sysio
          l_3_39 = l_3_39.IsPathAVExcluded
          l_3_39 = l_3_39(l_3_36, true)
          l_3_38.Excluded = l_3_39
        else
          l_3_38 = l_3_9.ScanPath
          l_3_38 = l_3_38[l_3_36]
          l_3_38.Exists = false
        end
      end
    end
    do
      l_3_27 = l_3_18.fullfilepathscan
      if l_3_27 then
        l_3_27 = l_3_18.fullfilepathscan
        l_3_28 = split
        l_3_28 = l_3_28(l_3_27, ",")
        for l_3_43,l_3_44 in ipairs(l_3_28) do
          local l_3_45 = (string.lower)((MpCommon.Base64Decode)(l_3_44))
          local l_3_46 = (sysio.IsFileExists)(l_3_45)
          local l_3_47 = table.insert
          local l_3_48 = l_3_9.Processed
          local l_3_49 = {}
          l_3_49.fullfilepathscan = l_3_45
          l_3_47(l_3_48, l_3_49)
          l_3_47 = l_3_9.FullFilePathScan
          l_3_47[l_3_45], l_3_48 = l_3_48, {}
          l_3_47 = true
          if l_3_46 then
            l_3_48 = string
            l_3_48 = l_3_48.match
            l_3_49 = l_3_45
            l_3_48 = l_3_48(l_3_49, "(.-)[\\/][^\\/]*$")
            l_3_49 = l_3_9.FullFilePathScan
            l_3_49 = l_3_49[l_3_45]
            l_3_49.Exists = true
            l_3_49 = pcall
            l_3_49 = l_3_49(IsAVExcluded, l_3_48)
            do
              if IsAVExcluded == nil then
                local l_3_50, l_3_51, l_3_52 = false
              end
              -- DECOMPILER ERROR at PC266: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_3_9.FullFilePathScan)[l_3_45]).Excluded = (sysio.IsPathAVExcluded)(l_3_48, true)
              -- DECOMPILER ERROR at PC269: Confused about usage of register: R27 in 'UnsetPending'

              -- DECOMPILER ERROR at PC269: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_3_9.FullFilePathScan)[l_3_45]).Excluded_LUA_API = l_3_50
              -- DECOMPILER ERROR at PC275: Confused about usage of register: R27 in 'UnsetPending'

              if ((l_3_9.FullFilePathScan)[l_3_45]).Excluded == true and l_3_50 == true then
                l_3_47 = false
              end
              l_3_47 = false
              l_3_48 = l_3_9.FullFilePathScan
              l_3_48 = l_3_48[l_3_45]
              l_3_48.Exists = false
              l_3_48 = pcallEx
              l_3_49 = "AppendToRollingQueueNamespaced"
              l_3_48 = l_3_48(l_3_49, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_3_2, l_3_45, 1, l_3_6, 500, 1)
              do
                if not l_3_48 then
                  local l_3_53 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC312: Confused about usage of register: R28 in 'UnsetPending'

                  if l_3_53 and type(l_3_53) == "table" then
                    ((l_3_9.FullFilePathScan)[l_3_45]).RQErrors = safeJsonSerialize(l_3_53, 260)
                  end
                end
                if l_3_47 then
                  (mp.TriggerScanResource)("file", l_3_45, 0, 10000)
                  local l_3_54 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_3_54 then
                    local l_3_55 = l_3_54 .. "\\system32\\"
                    local l_3_56 = (sysio.GetProcessFromFileName)(l_3_55 .. "svchost.exe")
                    if #l_3_56 > 0 then
                      local l_3_57 = (string.format)("pid:%d,ProcessStart:%u", (l_3_56[1]).pid, (l_3_56[1]).starttime)
                      if l_3_57 then
                        (MpCommon.BmTriggerSig)(l_3_57, "hmdprecisionpulsefullfilepathscan_statuscheck", l_3_45)
                      end
                    end
                  end
                else
                  do
                    local l_3_58 = (sysio.GetFileSize)(l_3_45)
                    local l_3_59 = (sysio.GetFileLastWriteTime)(l_3_45)
                    local l_3_60 = table.insert
                    local l_3_61 = ((l_3_9.FullFilePathScan)[l_3_45]).ExcludedFileInfo
                    local l_3_62 = {}
                    l_3_62.Size = l_3_58
                    l_3_62.LastModified = l_3_59
                    l_3_60(l_3_61, l_3_62)
                    l_3_60 = pcall
                    l_3_61 = CollectFile
                    l_3_62 = l_3_45
                    l_3_60 = l_3_60(l_3_61, l_3_62, l_3_58)
                    do
                      local l_3_63, l_3_64, l_3_65 = nil
                      -- DECOMPILER ERROR at PC385: Confused about usage of register: R35 in 'UnsetPending'

                      if l_3_60 then
                        if l_3_61 then
                          ((l_3_9.FullFilePathScan)[l_3_45]).Sha1 = l_3_62
                          -- DECOMPILER ERROR at PC388: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_3_9.FullFilePathScan)[l_3_45]).Sha256 = l_3_63
                          -- DECOMPILER ERROR at PC391: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_3_9.FullFilePathScan)[l_3_45]).PartialSha1 = l_3_64
                          -- DECOMPILER ERROR at PC394: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_3_9.FullFilePathScan)[l_3_45]).PartialSha256 = l_3_65
                          pcall(ReportResource, l_3_45, R38_PC401, (l_3_9.FullFilePathScan)[l_3_45])
                        else
                          -- DECOMPILER ERROR at PC405: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_3_9.FullFilePathScan)[l_3_45]).Error_Facility = l_3_62
                          -- DECOMPILER ERROR at PC408: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_3_9.FullFilePathScan)[l_3_45]).Error_Code = l_3_63
                        end
                      end
                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC409: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
      l_3_27 = l_3_18.scanfile
      if l_3_27 then
        l_3_27 = l_3_18.scanfile
        l_3_28 = split
        l_3_28 = l_3_28(l_3_27, ",")
        for l_3_69,l_3_70 in ipairs(l_3_28) do
          local l_3_71 = (string.lower)((MpCommon.Base64Decode)(l_3_70))
          local l_3_72 = table.insert
          local l_3_73 = l_3_9.Processed
          local l_3_74 = {}
          l_3_74.scanfile = l_3_71
          l_3_72(l_3_73, l_3_74)
          l_3_72 = AppendToRollingQueueNamespaced
          l_3_73 = "hmdprecisionpulsescanfile"
          l_3_74 = l_3_2
          l_3_72(l_3_73, l_3_74, l_3_71, 1, l_3_6, 500, 1)
        end
      end
      do
        do
          l_3_27 = l_3_18.enumeratefolder
          if l_3_27 then
            l_3_27 = 260
            l_3_28 = ""
            local l_3_75 = "*"
            local l_3_76 = 0
            local l_3_77 = true
            local l_3_78 = false
            local l_3_79 = l_3_18.enumeratefolder
            local l_3_80 = split(l_3_79, ",")
            local l_3_81 = 0
            for l_3_85,l_3_86 in ipairs(l_3_80) do
              l_3_81 = l_3_81 + 1
              -- DECOMPILER ERROR at PC471: Confused about usage of register: R29 in 'UnsetPending'

              if l_3_27 < l_3_81 then
                ((l_3_9.FolderEnumeration)[l_3_28]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_3_87 = (string.lower)((MpCommon.Base64Decode)(l_3_86))
              local l_3_88 = explode(l_3_87, "|")
              if #l_3_88 == 4 then
                l_3_28 = l_3_88[1]
                l_3_75 = l_3_88[2]
                l_3_76 = tonumber(l_3_88[3]) or 0
                l_3_77 = tonumber(l_3_88[4]) == 1
              elseif #l_3_88 == 5 then
                l_3_28 = l_3_88[1]
                l_3_75 = l_3_88[2]
                l_3_76 = tonumber(l_3_88[3]) or 0
                l_3_77 = tonumber(l_3_88[4]) == 1
                l_3_78 = tonumber(l_3_88[5]) == 1
              else
                l_3_28 = l_3_88[1]
              end
              if l_3_28 ~= nil then
                local l_3_89 = #l_3_28 + 2
                -- DECOMPILER ERROR at PC536: Confused about usage of register: R32 in 'UnsetPending'

                ;
                (l_3_9.FolderEnumeration)[l_3_28] = {}
                -- DECOMPILER ERROR at PC540: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_3_9.FolderEnumeration)[l_3_28]).Files = {}
                -- DECOMPILER ERROR at PC544: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_3_9.FolderEnumeration)[l_3_28]).Subfolders = {}
                local l_3_90 = (sysio.FindFiles)(l_3_28, l_3_75, l_3_76)
                local l_3_91 = (sysio.FindFolders)(l_3_28, "*", 0)
                if l_3_90 ~= nil then
                  local l_3_92 = 0
                  for R38_PC401,l_3_97 in pairs(l_3_90) do
                    l_3_92 = l_3_92 + 1
                    -- DECOMPILER ERROR at PC569: Confused about usage of register: R40 in 'UnsetPending'

                    if l_3_27 < l_3_92 then
                      ((l_3_9.FolderEnumeration)[l_3_28]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC573: Confused about usage of register: R40 in 'UnsetPending'

                      ;
                      ((l_3_9.FolderEnumeration)[l_3_28]).TotalFilesEnumerated = #l_3_90
                      break
                    end
                    local l_3_98 = (string.sub)(l_3_97, l_3_89)
                    if l_3_78 then
                      local l_3_99 = (sysio.GetFileSize)(l_3_97)
                      local l_3_100 = (sysio.GetFileLastWriteTime)(l_3_97)
                      local l_3_101 = table.insert
                      local l_3_102 = ((l_3_9.FolderEnumeration)[l_3_28]).Files
                      local l_3_103 = {}
                      l_3_103.Name = l_3_98
                      l_3_103.Size = l_3_99
                      l_3_103.LastModified = l_3_100
                      l_3_101(l_3_102, l_3_103)
                      l_3_92 = l_3_92 + 1
                    end
                    if l_3_77 then
                      local l_3_104 = l_3_8
                      local l_3_105 = (MpCommon.AtomicCounterAddNamespaced)(l_3_3, l_3_2, 1)
                      -- DECOMPILER ERROR at PC614: Confused about usage of register: R43 in 'UnsetPending'

                      if l_3_104 <= l_3_105 then
                        ((l_3_9.FolderEnumeration)[l_3_28]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_3_2, (string.lower)(l_3_97), 1, l_3_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_3_97), 0, 5000)
                      end
                    end
                  end
                end
                l_3_92 = table
                l_3_92 = l_3_92.insert
                local l_3_106 = nil
                l_3_106 = l_3_9.Processed
                local l_3_107 = nil
                local l_3_108 = nil
                l_3_92(l_3_106, l_3_107)
                l_3_107 = {enumeratefolder = l_3_28}
                l_3_92 = sysio
                l_3_92 = l_3_92.IsFolderExists
                l_3_106 = l_3_28
                l_3_92 = l_3_92(l_3_106)
                if l_3_92 then
                  l_3_106 = l_3_9.FolderEnumeration
                  l_3_106 = l_3_106[l_3_28]
                  l_3_106.Exists = true
                  l_3_106 = l_3_9.FolderEnumeration
                  l_3_106 = l_3_106[l_3_28]
                  l_3_107 = sysio
                  l_3_107 = l_3_107.IsPathAVExcluded
                  l_3_108 = l_3_28
                  l_3_107 = l_3_107(l_3_108, true)
                  l_3_106.Excluded = l_3_107
                else
                  l_3_106 = l_3_9.FolderEnumeration
                  l_3_106 = l_3_106[l_3_28]
                  l_3_106.Exists = false
                end
                if l_3_78 == false then
                  l_3_106 = #l_3_90
                  if l_3_106 <= l_3_27 then
                    l_3_106 = table
                    l_3_106 = l_3_106.insert
                    l_3_107 = l_3_9.FolderEnumeration
                    l_3_107 = l_3_107[l_3_28]
                    local l_3_109 = nil
                    l_3_106(l_3_107, l_3_108)
                    l_3_108 = {Files = l_3_90}
                  else
                    l_3_107 = 1
                    l_3_108 = l_3_27
                    for i = l_3_107, l_3_108 do
                      local l_3_112 = nil
                      l_3_112 = l_3_90[l_3_111]
                    end
                    local l_3_113 = nil
                    local l_3_114 = nil
                    local l_3_115 = nil
                    ;
                    (table.insert)((l_3_9.FolderEnumeration)[l_3_28], l_3_113)
                    l_3_113 = {Files = l_3_106}
                    -- DECOMPILER ERROR at PC698: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_3_9.FolderEnumeration)[l_3_28]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC702: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_3_9.FolderEnumeration)[l_3_28]).TotalFilesEnumerated = #l_3_90
                  end
                end
                -- DECOMPILER ERROR at PC705: Overwrote pending register: R35 in 'AssignReg'

                if l_3_91 ~= nil then
                  for l_3_119,l_3_120 in pairs(l_3_91) do
                    local l_3_119, l_3_120 = nil
                    -- DECOMPILER ERROR at PC710: Overwrote pending register: R35 in 'AssignReg'

                    if l_3_27 < l_3_106 then
                      break
                    end
                    l_3_119 = string
                    l_3_119 = l_3_119.sub
                    l_3_120 = l_3_118
                    l_3_119 = l_3_119(l_3_120, l_3_89)
                    local l_3_121 = nil
                    l_3_120 = table
                    l_3_120 = l_3_120.insert
                    l_3_121 = l_3_9.FolderEnumeration
                    l_3_121 = l_3_121[l_3_28]
                    l_3_121 = l_3_121.Subfolders
                    l_3_120(l_3_121, l_3_119)
                  end
                end
                -- DECOMPILER ERROR at PC728: Overwrote pending register: R35 in 'AssignReg'

                l_3_106("hmdprecisionpulseenumeratefolder", l_3_2, l_3_28, 1, l_3_6, 500, 1)
                -- DECOMPILER ERROR at PC737: Confused about usage of register R37 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_3_27 = l_3_18.enumerateregistrykey
          if l_3_27 then
            l_3_27 = ""
            l_3_28 = l_3_18.enumerateregistrykey
            l_3_75 = split
            l_3_76 = l_3_28
            l_3_77 = ","
            l_3_75 = l_3_75(l_3_76, l_3_77)
            local l_3_122 = nil
            l_3_76 = ipairs
            l_3_77 = l_3_75
            l_3_76 = l_3_76(l_3_77)
            for l_3_79,l_3_80 in l_3_76 do
              local l_3_123, l_3_124, l_3_125, l_3_126, l_3_127 = nil
              l_3_81 = string
              l_3_81 = l_3_81.lower
              l_3_81 = l_3_81((MpCommon.Base64Decode)(l_3_80))
              local l_3_128 = nil
              l_3_27 = l_3_81
              if l_3_27 ~= nil then
                local l_3_129 = nil
                -- DECOMPILER ERROR at PC768: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC772: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC776: Confused about usage of register: R25 in 'UnsetPending'

                local l_3_130 = nil
                local l_3_131 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_3_27)) ~= nil then
                  (table.insert)(((l_3_9.RegkeyEnumeration)[l_3_27]).Keys, l_3_87)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_3_27)) ~= nil then
                    for l_3_88,l_3_89 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_3_27))) do
                      local l_3_132, l_3_133, l_3_134, l_3_135, l_3_136 = nil
                      l_3_90 = sysio
                      l_3_90 = l_3_90.GetRegValueType
                      l_3_91 = (sysio.RegOpenKey)(l_3_27)
                      l_3_92 = l_3_89
                      l_3_90 = (l_3_90(l_3_91, l_3_92))
                      local l_3_137 = nil
                      l_3_91 = nil
                      local l_3_138 = nil
                      if l_3_90 == 1 then
                        l_3_92 = sysio
                        l_3_92 = l_3_92.GetRegValueAsString
                        -- DECOMPILER ERROR at PC810: Overwrote pending register: R35 in 'AssignReg'

                        l_3_92 = l_3_92(l_3_106, l_3_89)
                        l_3_91 = l_3_92 or "Value not set"
                        l_3_92 = l_3_9.RegkeyEnumeration
                        l_3_92 = l_3_92[l_3_27]
                        l_3_92 = l_3_92.Values
                        l_3_92[l_3_89], l_3_106 = l_3_106, {}
                        l_3_92 = table
                        l_3_92 = l_3_92.insert
                        l_3_106 = l_3_9.RegkeyEnumeration
                        l_3_106 = l_3_106[l_3_27]
                        l_3_106 = l_3_106.Values
                        l_3_106 = l_3_106[l_3_89]
                        l_3_92(l_3_106, (l_3_91) .. l_3_122)
                      elseif l_3_90 == 2 then
                        l_3_92 = sysio
                        l_3_92 = l_3_92.GetRegValueAsString
                        l_3_106 = (sysio.RegOpenKey)(l_3_27)
                        l_3_92 = l_3_92(l_3_106, l_3_89)
                        l_3_91 = l_3_92 or "Value not set"
                        l_3_92 = l_3_9.RegkeyEnumeration
                        l_3_92 = l_3_92[l_3_27]
                        l_3_92 = l_3_92.Values
                        l_3_92[l_3_89], l_3_106 = l_3_106, {}
                        l_3_92 = table
                        l_3_92 = l_3_92.insert
                        l_3_106 = l_3_9.RegkeyEnumeration
                        l_3_106 = l_3_106[l_3_27]
                        l_3_106 = l_3_106.Values
                        l_3_106 = l_3_106[l_3_89]
                        -- DECOMPILER ERROR at PC854: Overwrote pending register: R37 in 'AssignReg'

                        l_3_92(l_3_106, (l_3_91) .. l_3_122)
                      elseif l_3_90 == 3 then
                        l_3_92 = sysio
                        l_3_92 = l_3_92.GetRegValueAsBinary
                        l_3_106 = (sysio.RegOpenKey)(l_3_27)
                        l_3_92 = l_3_92(l_3_106, l_3_89)
                        l_3_91 = l_3_92 or "Value not set"
                        l_3_92 = l_3_9.RegkeyEnumeration
                        l_3_92 = l_3_92[l_3_27]
                        l_3_92 = l_3_92.Values
                        l_3_92[l_3_89], l_3_106 = l_3_106, {}
                        l_3_92 = table
                        l_3_92 = l_3_92.insert
                        l_3_106 = l_3_9.RegkeyEnumeration
                        l_3_106 = l_3_106[l_3_27]
                        l_3_106 = l_3_106.Values
                        l_3_106 = l_3_106[l_3_89]
                        -- DECOMPILER ERROR at PC880: Overwrote pending register: R37 in 'AssignReg'

                        l_3_92(l_3_106, (l_3_91) .. l_3_122)
                      elseif l_3_90 == 4 then
                        l_3_92 = sysio
                        l_3_92 = l_3_92.GetRegValueAsDword
                        l_3_106 = (sysio.RegOpenKey)(l_3_27)
                        l_3_92 = l_3_92(l_3_106, l_3_89)
                        l_3_91 = l_3_92 or "Value not set"
                        l_3_92 = l_3_9.RegkeyEnumeration
                        l_3_92 = l_3_92[l_3_27]
                        l_3_92 = l_3_92.Values
                        l_3_92[l_3_89], l_3_106 = l_3_106, {}
                        l_3_92 = table
                        l_3_92 = l_3_92.insert
                        l_3_106 = l_3_9.RegkeyEnumeration
                        l_3_106 = l_3_106[l_3_27]
                        l_3_106 = l_3_106.Values
                        l_3_106 = l_3_106[l_3_89]
                        -- DECOMPILER ERROR at PC906: Overwrote pending register: R37 in 'AssignReg'

                        l_3_92(l_3_106, (l_3_91) .. l_3_122)
                      elseif l_3_90 == 7 then
                        l_3_92 = sysio
                        l_3_92 = l_3_92.GetRegValueAsMultiString
                        l_3_106 = (sysio.RegOpenKey)(l_3_27)
                        l_3_92 = l_3_92(l_3_106, l_3_89)
                        l_3_91 = l_3_92 or "Value not set"
                        l_3_92 = l_3_9.RegkeyEnumeration
                        l_3_92 = l_3_92[l_3_27]
                        l_3_92 = l_3_92.Values
                        l_3_92[l_3_89], l_3_106 = l_3_106, {}
                        l_3_92 = ipairs
                        l_3_106 = l_3_91
                        l_3_92 = l_3_92(l_3_106)
                        for l_3_122,l_3_123 in l_3_92 do
                          local l_3_139, l_3_140, l_3_141, l_3_142, l_3_143 = nil
                          l_3_124 = table
                          l_3_124 = l_3_124.insert
                          l_3_125 = l_3_9.RegkeyEnumeration
                          l_3_125 = l_3_125[l_3_27]
                          l_3_125 = l_3_125.Values
                          l_3_125 = l_3_125[l_3_89]
                          l_3_126 = l_3_123
                          l_3_127 = " (REG_MULTI_SZ)"
                          l_3_126 = l_3_126 .. l_3_127
                          l_3_124(l_3_125, l_3_126)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_3_27), l_3_89) then
                          l_3_91 = l_3_90 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC956: Confused about usage of register: R34 in 'UnsetPending'

                        ;
                        (((l_3_9.RegkeyEnumeration)[l_3_27]).Values)[l_3_89] = {}
                        -- DECOMPILER ERROR at PC964: Overwrote pending register: R37 in 'AssignReg'

                        ;
                        (table.insert)((((l_3_9.RegkeyEnumeration)[l_3_27]).Values)[l_3_89], (l_3_91) .. l_3_122)
                      end
                      l_3_91 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_3_27), l_3_89) or "Value not set"
                      -- DECOMPILER ERROR at PC980: Confused about usage of register: R34 in 'UnsetPending'

                      ;
                      (((l_3_9.RegkeyEnumeration)[l_3_27]).Values)[l_3_89] = {}
                      ;
                      (table.insert)((((l_3_9.RegkeyEnumeration)[l_3_27]).Values)[l_3_89], (l_3_91) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_3_144 = nil
                local l_3_145 = nil
                local l_3_146 = nil
                ;
                (table.insert)(l_3_9.Processed, {enumerateregistrykey = l_3_27})
              end
            end
            -- DECOMPILER ERROR at PC1001: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          end
          l_3_27 = l_3_18.deleteregistryvalue
          if l_3_27 then
            l_3_27 = ""
            l_3_28 = l_3_18.deleteregistryvalue
            l_3_75 = split
            l_3_75 = l_3_75(l_3_28, ",")
            local l_3_147 = nil
            for l_3_151,l_3_152 in ipairs(l_3_75) do
              local l_3_148, l_3_149, l_3_150, l_3_151, l_3_152 = nil
              l_3_81 = string
              l_3_81 = l_3_81.lower
              -- DECOMPILER ERROR at PC1018: Confused about usage of register: R22 in 'UnsetPending'

              l_3_81 = l_3_81((MpCommon.Base64Decode)(l_3_80))
              local l_3_153 = nil
              if l_3_27 ~= nil then
                l_3_27 = explode(l_3_81, "|")
                if #l_3_27 == 2 then
                  local l_3_154 = nil
                  local l_3_155 = nil
                  -- DECOMPILER ERROR at PC1035: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1038: Confused about usage of register: R24 in 'UnsetPending'

                  local l_3_156 = nil
                  if (sysio.RegOpenKey)(l_3_27[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1049: Confused about usage of register: R24 in 'UnsetPending'

                    local l_3_157 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_3_2, (string.format)("%s\\\\%s", l_3_27[1], l_3_27[2]), l_3_90, l_3_91, 500, 1)
                    -- DECOMPILER ERROR at PC1066: Overwrote pending register: R32 in 'AssignReg'

                    local l_3_158, l_3_159 = nil
                    -- DECOMPILER ERROR at PC1071: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1071: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_3_90)
                    -- DECOMPILER ERROR at PC1075: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1076: Overwrote pending register: R33 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_3_90, l_3_91, 1, l_3_6, 500, 1)
                    -- DECOMPILER ERROR at PC1085: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1086: Overwrote pending register: R33 in 'AssignReg'

                    local l_3_160, l_3_161 = nil
                    -- DECOMPILER ERROR at PC1089: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1090: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1091: Overwrote pending register: R33 in 'AssignReg'

                    l_3_90(l_3_91, (string.format)("%s\\\\%s", l_3_27[1], l_3_27[2]))
                  else
                    -- DECOMPILER ERROR at PC1096: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1096: Confused about usage of register: R27 in 'UnsetPending'

                  end
                  local l_3_162 = nil
                  -- DECOMPILER ERROR at PC1099: Overwrote pending register: R28 in 'AssignReg'

                  local l_3_163 = nil
                  local l_3_164 = nil
                  -- DECOMPILER ERROR at PC1101: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1101: Overwrote pending register: R30 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1103: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1103: Overwrote pending register: R32 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_3_2, l_3_90), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_3_90, l_3_91, (string.format)("%s\\\\%s", l_3_27[1], l_3_27[2])) .. " " .. l_3_90})
                end
              end
            end
          end
          l_3_27 = l_3_18.process
          if l_3_27 then
            l_3_27 = mp
            l_3_27 = l_3_27.get_contextdata
            l_3_28 = mp
            l_3_28 = l_3_28.CONTEXT_DATA_PROCESS_PPID
            l_3_27 = l_3_27(l_3_28)
            if l_3_27 == nil then
              l_3_28 = MpCommon
              l_3_28 = l_3_28.ExpandEnvironmentVariables
              l_3_75 = "%windir%"
              l_3_28 = l_3_28(l_3_75)
              l_3_75 = l_3_28
              l_3_75 = l_3_75 .. "\\system32\\"
              local l_3_165 = nil
              local l_3_166 = nil
              if #(sysio.GetProcessFromFileName)(l_3_75 .. "svchost.exe") > 0 then
                l_3_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_3_75 .. "svchost.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_3_75 .. "svchost.exe"))[1]).starttime)
              end
            end
            l_3_28 = table
            l_3_28 = l_3_28.insert
            l_3_75 = l_3_9.Processed
            local l_3_167 = nil
            local l_3_168 = nil
            l_3_28(l_3_75, {process = l_3_18.process})
            l_3_28 = MpCommon
            l_3_28 = l_3_28.BmTriggerSig
            l_3_75 = l_3_27
            l_3_28(l_3_75, "Heimdall_ProcessDispatch", l_3_18.process)
          end
          l_3_27 = l_3_18.firewall
          if l_3_27 then
            l_3_27 = l_3_18.firewall
            l_3_28 = split
            l_3_75 = l_3_27
            l_3_28 = l_3_28(l_3_75, ",")
            l_3_75 = ipairs
            l_3_75 = l_3_75(l_3_28)
            for l_3_172,l_3_173 in l_3_75 do
              local l_3_169, l_3_170, l_3_171, l_3_172, l_3_173 = nil
              -- DECOMPILER ERROR at PC1171: Confused about usage of register: R21 in 'UnsetPending'

              local l_3_174 = nil
              -- DECOMPILER ERROR at PC1175: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1176: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_3_81) then
                local l_3_175 = nil
                local l_3_176 = nil
                local l_3_177 = nil
                l_3_81(l_3_9.Processed, {firewall = (MpCommon.Base64Decode)(l_3_81)})
                -- DECOMPILER ERROR at PC1181: Overwrote pending register: R23 in 'AssignReg'

                l_3_81 = l_3_81((MpCommon.Base64Decode)(l_3_81), "_")
                l_3_81 = #l_3_81
                if l_3_81 == 3 then
                  l_3_81 = tonumber
                  -- DECOMPILER ERROR at PC1190: Confused about usage of register: R22 in 'UnsetPending'

                  l_3_81 = l_3_81(l_3_81[2])
                  -- DECOMPILER ERROR at PC1194: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1195: Confused about usage of register: R22 in 'UnsetPending'

                  local l_3_178 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_3_81[1], l_3_81[3], (mp.bitand)(l_3_81, 2) == 2, (mp.bitand)(l_3_81, 1) == 1)
                end
              end
            end
          end
          l_3_27 = l_3_18.sinkholedns
          if l_3_27 then
            l_3_27 = l_3_18.sinkholedns
            l_3_28 = split
            l_3_28 = l_3_28(l_3_27, ",")
            for l_3_187,l_3_188 in ipairs(l_3_28) do
              local l_3_184, l_3_185, l_3_186, l_3_187, l_3_188 = nil
              -- DECOMPILER ERROR at PC1231: Confused about usage of register: R21 in 'UnsetPending'

              local l_3_189 = nil
              -- DECOMPILER ERROR at PC1233: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1234: Overwrote pending register: R23 in 'AssignReg'

              local l_3_190 = nil
              local l_3_191 = nil
              local l_3_192 = nil
              l_3_81(l_3_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_3_81)})
              -- DECOMPILER ERROR at PC1241: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_3_81) then
                l_3_81 = l_3_81((MpCommon.Base64Decode)(l_3_81), "_")
                -- DECOMPILER ERROR at PC1247: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC1249: Confused about usage of register: R22 in 'UnsetPending'

                l_3_81 = l_3_81(l_3_81[1], l_3_81[2])
                -- DECOMPILER ERROR at PC1253: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1255: Confused about usage of register: R22 in 'UnsetPending'

                local l_3_193 = nil
                l_3_9["sinkholedns" .. "_" .. l_3_81[1] .. "_" .. l_3_81[2]] = {res = l_3_81, isAllowed = l_3_81[1]}
              end
            end
          end
          l_3_27 = l_3_18.dnscache
          if l_3_27 then
            l_3_27 = l_3_18.dnscache
            l_3_28 = split
            l_3_28 = l_3_28(l_3_27, ",")
            for l_3_197,l_3_198 in ipairs(l_3_28) do
              local l_3_194, l_3_195, l_3_196, l_3_197, l_3_198 = nil
              -- DECOMPILER ERROR at PC1277: Confused about usage of register: R21 in 'UnsetPending'

              local l_3_199 = nil
              -- DECOMPILER ERROR at PC1279: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1280: Overwrote pending register: R23 in 'AssignReg'

              local l_3_200 = nil
              local l_3_201 = nil
              local l_3_202 = nil
              l_3_81(l_3_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_3_81)})
              -- DECOMPILER ERROR at PC1287: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_3_81) then
                l_3_81 = l_3_81((MpCommon.Base64Decode)(l_3_81), "_")
                for i_1,i_2 in ipairs(l_3_81) do
                  local l_3_203, l_3_204, l_3_205 = nil
                  l_3_9["dnscache" .. "_" .. i_2], l_3_81 = l_3_81, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_3_27 = l_3_18.debug
          if l_3_27 then
            l_3_27 = l_3_18.debug
            l_3_28 = split
            l_3_28 = l_3_28(l_3_27, ",")
            local l_3_206 = nil
            for l_3_210,l_3_211 in ipairs(l_3_28) do
              local l_3_207, l_3_208, l_3_209, l_3_210, l_3_211 = nil
              l_3_81 = MpCommon
              l_3_81 = l_3_81.Base64Decode
              -- DECOMPILER ERROR at PC1326: Confused about usage of register: R22 in 'UnsetPending'

              l_3_81 = l_3_81(l_3_81)
              local l_3_212 = nil
              local l_3_213 = nil
              local l_3_214 = nil
              local l_3_215 = nil
              ;
              (table.insert)(l_3_9.Processed, {debug = l_3_81})
              for l_3_219,l_3_220 in ipairs((split(l_3_81, "_"))) do
                local l_3_216, l_3_217, l_3_218, l_3_219, l_3_220 = nil
                -- DECOMPILER ERROR at PC1343: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1344: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1344: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1348: Overwrote pending register: R25 in 'AssignReg'

                -- DECOMPILER ERROR at PC1349: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1349: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1352: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1352: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1353: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1355: Overwrote pending register: R32 in 'AssignReg'

                if nil == "PC" then
                  local l_3_221 = nil
                  -- DECOMPILER ERROR at PC1356: Overwrote pending register: R33 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1360: Confused about usage of register: R26 in 'UnsetPending'

                  l_3_91 = l_3_91(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1365: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1367: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1367: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PCNP" then
                    l_3_91 = ":"
                    -- DECOMPILER ERROR at PC1369: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1370: Overwrote pending register: R32 in 'AssignReg'

                    local l_3_222 = nil
                    l_3_91 = table_pack
                    -- DECOMPILER ERROR at PC1375: Confused about usage of register: R26 in 'UnsetPending'

                    l_3_91 = l_3_91(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1380: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1382: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1382: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "RQ" then
                      l_3_91 = ":"
                      -- DECOMPILER ERROR at PC1384: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1385: Overwrote pending register: R32 in 'AssignReg'

                      local l_3_223 = nil
                      l_3_91 = table_pack
                      -- DECOMPILER ERROR at PC1390: Confused about usage of register: R26 in 'UnsetPending'

                      l_3_91 = l_3_91(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1395: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1397: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1397: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "AC" then
                        l_3_91 = ":"
                        -- DECOMPILER ERROR at PC1399: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1400: Overwrote pending register: R32 in 'AssignReg'

                        local l_3_224 = nil
                        l_3_91 = table_pack
                        -- DECOMPILER ERROR at PC1405: Confused about usage of register: R26 in 'UnsetPending'

                        l_3_91 = l_3_91(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_3_9.debug = {[l_3_90] = l_3_91, [l_3_90] = l_3_91, [l_3_90] = l_3_91, [l_3_90] = l_3_91}
          end
          l_3_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_3_10.report = safeJsonSerialize(l_3_9, 260)
          l_3_10.TAG = "NOLOOKUP"
          pcall(mp.GetUrlReputation, l_3_28, l_3_10)
          -- DECOMPILER ERROR at PC1429: Confused about usage of register R37 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


