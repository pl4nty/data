-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\PrecisionPulseHelpers\1.luac 

-- params : ...
-- function num : 0
ReportSupportLog = function()
  -- function num : 0_0
  do
    local l_1_0, l_1_1 = (MpCommon.ExpandEnvironmentVariables)("%ProgramData%") or "C:\\ProgramData"
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R0 in 'UnsetPending'

    local l_1_2 = nil
    local l_1_3 = nil
    for l_1_7,l_1_8 in pairs((sysio.FindFiles)(l_1_0 .. "\\Microsoft\\Windows Defender\\Support", "*", 1)) do
      local l_1_4 = nil
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R7 in 'UnsetPending'

      if (string.find)(R7_PC22, "MpWppTracing", 1, true) or (string.find)(R7_PC22, "MPScanSkip", 1, true) or (string.find)(R7_PC22, "MPLog", 1, true) then
        local l_1_10 = nil
        local l_1_11 = (sysio.ReadFile)(l_1_9, 0, (sysio.GetFileSize)(R7_PC22))
        if ((sysio.GetLastResult)()).Success then
          l_1_11 = (MpCommon.GzipCompress)(l_1_11)
          l_1_11 = (MpCommon.Base64Encode)(l_1_11)
          local l_1_12 = nil
          local l_1_13 = {}
          local l_1_14 = (sysio.GetFileSize)(l_1_9)
          local l_1_15 = (sysio.GetFileLastWriteTime)(l_1_9)
          local l_1_16 = table.insert
          local l_1_17 = l_1_13
          l_1_16(l_1_17, {Size = l_1_14, LastModified = l_1_15})
          l_1_16 = ReportResource
          l_1_17 = l_1_9
          l_1_16(l_1_17, l_1_11, l_1_13)
        else
          do
            local l_1_18 = nil
            local l_1_19 = ReportResource
            local l_1_20 = l_1_9
            do
              local l_1_21 = ""
              l_1_19(l_1_20, l_1_21, {Facility = l_1_18.Facility, Code = l_1_18.Code})
              -- DECOMPILER ERROR at PC104: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC104: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC104: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC104: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC104: LeaveBlock: unexpected jumping out IF_STMT

            end
          end
        end
      end
    end
  end
end

CollectFile = function(l_2_0, l_2_1, l_2_2)
  -- function num : 0_1
  l_2_1 = l_2_1 ~= nil or (sysio.GetFileSize)(l_2_0) or 0
  local l_2_3 = 2086912
  local l_2_4 = nil
  if l_2_3 < l_2_1 then
    l_2_4 = (sysio.ReadFile)(l_2_0, 0, l_2_3)
  else
    l_2_4 = (sysio.ReadFile)(l_2_0, 0, l_2_1)
  end
  local l_2_5 = (sysio.GetLastResult)()
  if not l_2_5.Success then
    return nil, l_2_5.Facility, l_2_5.Code
  end
  local l_2_6, l_2_7, l_2_8, l_2_9 = nil, nil, nil, nil
  if l_2_3 < l_2_1 then
    l_2_8 = (crypto.Sha1Buffer)(l_2_4, 0, #l_2_4)
    l_2_9 = (crypto.Sha256Buffer)(l_2_4, 0, #l_2_4)
  else
    l_2_6 = (crypto.Sha1Buffer)(l_2_4, 0, #l_2_4)
    l_2_7 = (crypto.Sha256Buffer)(l_2_4, 0, #l_2_4)
  end
  if l_2_4 then
    l_2_4 = (MpCommon.GzipCompress)(l_2_4)
    l_2_4 = (MpCommon.Base64Encode)(l_2_4)
    return l_2_4, l_2_6, l_2_7, l_2_8, l_2_9
  end
  return 
end

ReportResource = function(l_3_0, l_3_1, l_3_2)
  -- function num : 0_2
  if not l_3_2 then
    l_3_2 = {}
  end
  if not l_3_1 or not l_3_0 then
    return 
  end
  local l_3_3 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_3_4 = {}
  l_3_4[1] = l_3_3
  do
    if #l_3_1 < 2086912 then
      local l_3_5 = {}
      l_3_5.SIG_CONTEXT = "Lua_Custom_Upload_Resource"
      l_3_5.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
      l_3_5.TAG = "NOLOOKUP"
      l_3_5.ResourceName = l_3_0
      l_3_5.ResourceContent = l_3_1
      l_3_5.ResourceInfo = safeJsonSerialize(l_3_2)
      SafeGetUrlReputation(l_3_4, l_3_5, false, 2000)
      return 
    end
    local l_3_6 = 2086912
    local l_3_7 = #l_3_1
    local l_3_8 = 1
    local l_3_9 = 0
    local l_3_10 = 10
    while l_3_8 <= l_3_7 and l_3_9 < l_3_10 do
      local l_3_11 = l_3_1:sub(l_3_8, l_3_8 + l_3_6 - 1)
      l_3_8 = l_3_8 + l_3_6
      local l_3_12 = {}
      l_3_12.SIG_CONTEXT = "Lua_Custom_Upload_Resource"
      l_3_12.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
      l_3_12.TAG = "NOLOOKUP"
      l_3_12.ResourceName = l_3_0
      l_3_12.ResourceContent = l_3_11
      l_3_12.ResourceInfo = safeJsonSerialize(l_3_2)
      l_3_12.Index = l_3_9
      l_3_9 = l_3_9 + 1
      SafeGetUrlReputation(l_3_4, l_3_12, false, 2000 + (l_3_9) * 500)
    end
  end
end

EnablePrecisionPulse = function(l_4_0, l_4_1, l_4_2, l_4_3, l_4_4)
  -- function num : 0_3
  local l_4_5 = 60
  local l_4_6 = 300
  local l_4_7 = nil
  local l_4_8 = 500
  local l_4_9 = {}
  l_4_9.Processed = {}
  l_4_9.FolderEnumeration = {}
  l_4_9.ScanPath = {}
  l_4_9.FullFilePathScan = {}
  l_4_9.RegkeyEnumeration = {}
  l_4_9.DeleteRegValue = {}
  local l_4_10 = {}
  l_4_10.SIG_CONTEXT = "LUA_GENERIC"
  l_4_10.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_4_10.TAG = "NOLOOKUP"
  local l_4_11 = {}
  for l_4_15 in l_4_0:gmatch("[^%+][^%+]+") do
    local l_4_16, l_4_17 = l_4_15:match("(.+)::(.+)")
    if l_4_16 and l_4_17 then
      l_4_11[l_4_16] = l_4_17
    end
  end
  local l_4_18 = {}
  local l_4_19 = l_4_11
  for l_4_23,l_4_24 in pairs(l_4_19) do
    local l_4_25 = l_4_23
    l_4_18[l_4_25] = l_4_24
  end
  if l_4_18.tracking_id then
    l_4_7 = l_4_18.tracking_id
  end
  if l_4_7 == nil then
    l_4_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_4_26 = table.insert
  local l_4_27 = l_4_9.Processed
  local l_4_28 = {}
  l_4_28.TrackingId = l_4_7
  l_4_26(l_4_27, l_4_28)
  l_4_26 = l_4_18.ttl
  if l_4_26 then
    l_4_6 = l_4_18.ttl
    l_4_26 = table
    l_4_26 = l_4_26.insert
    l_4_27 = l_4_9.Processed
    l_4_26(l_4_27, l_4_28)
    l_4_28 = {Ttl = l_4_6}
  end
  l_4_26 = l_4_18.suppress_ttl
  if l_4_26 then
    l_4_5 = l_4_18.suppress_ttl
    l_4_26 = table
    l_4_26 = l_4_26.insert
    l_4_27 = l_4_9.Processed
    l_4_26(l_4_27, l_4_28)
    l_4_28 = {suppress_ttl = l_4_5}
  end
  l_4_26 = MpCommon
  l_4_26 = l_4_26.AtomicCounterValueNamespaced
  l_4_27 = l_4_3
  l_4_28 = l_4_2
  l_4_26 = l_4_26(l_4_27, l_4_28)
  if l_4_26 == nil then
    l_4_27 = MpCommon
    l_4_27 = l_4_27.AtomicCounterSetNamespaced
    l_4_28 = l_4_3
    l_4_27(l_4_28, l_4_2, 0, l_4_5)
  end
  l_4_27 = l_4_18.maxscan
  if l_4_27 then
    l_4_27 = tonumber
    l_4_28 = l_4_18.maxscan
    l_4_27 = l_4_27(l_4_28)
    l_4_8 = l_4_27 or 500
    l_4_27 = MpCommon
    l_4_27 = l_4_27.AtomicCounterValueNamespaced
    l_4_28 = l_4_4
    l_4_27 = l_4_27(l_4_28, l_4_2)
    if l_4_27 == nil then
      l_4_28 = MpCommon
      l_4_28 = l_4_28.AtomicCounterSetNamespaced
      l_4_28(l_4_4, l_4_2, l_4_8, l_4_6)
    else
      l_4_28 = MpCommon
      l_4_28 = l_4_28.AtomicCounterSubNamespaced
      l_4_28(l_4_4, l_4_2, l_4_27)
      l_4_28 = MpCommon
      l_4_28 = l_4_28.AtomicCounterAddNamespaced
      l_4_28(l_4_4, l_4_2, l_4_8)
    end
    l_4_28 = table
    l_4_28 = l_4_28.insert
    local l_4_29 = l_4_9.Processed
    local l_4_30 = {}
    l_4_30.max_scan = l_4_8
    l_4_28(l_4_29, l_4_30)
  end
  do
    l_4_27 = l_4_18.scanpath
    if l_4_27 then
      l_4_27 = l_4_18.scanpath
      l_4_28 = split
      l_4_28 = l_4_28(l_4_27, ",")
      for l_4_34,l_4_35 in ipairs(l_4_28) do
        local l_4_36 = (string.lower)((MpCommon.Base64Decode)(l_4_35))
        local l_4_37 = table.insert
        local l_4_38 = l_4_9.Processed
        local l_4_39 = {}
        l_4_39.scanpath = l_4_36
        l_4_37(l_4_38, l_4_39)
        l_4_37 = AppendToRollingQueueNamespaced
        l_4_38 = "hmdprecisionpulsefolderscan"
        l_4_39 = l_4_2
        l_4_37(l_4_38, l_4_39, l_4_36, 1, l_4_6, 500, 1)
        l_4_37 = mp
        l_4_37 = l_4_37.TriggerScanResource
        l_4_38 = "folder"
        l_4_39 = l_4_36
        l_4_37(l_4_38, l_4_39, 0, 5000)
        l_4_37 = l_4_9.ScanPath
        l_4_37[l_4_36], l_4_38 = l_4_38, {}
        l_4_37 = table
        l_4_37 = l_4_37.insert
        l_4_38 = l_4_9.Processed
        l_4_37(l_4_38, l_4_39)
        l_4_39 = {scanpath = l_4_36}
        l_4_37 = sysio
        l_4_37 = l_4_37.IsFolderExists
        l_4_38 = l_4_36
        l_4_37 = l_4_37(l_4_38)
        if l_4_37 then
          l_4_38 = l_4_9.ScanPath
          l_4_38 = l_4_38[l_4_36]
          l_4_38.Exists = true
          l_4_38 = l_4_9.ScanPath
          l_4_38 = l_4_38[l_4_36]
          l_4_39 = sysio
          l_4_39 = l_4_39.IsPathAVExcluded
          l_4_39 = l_4_39(l_4_36, true)
          l_4_38.Excluded = l_4_39
        else
          l_4_38 = l_4_9.ScanPath
          l_4_38 = l_4_38[l_4_36]
          l_4_38.Exists = false
        end
      end
    end
    do
      l_4_27 = l_4_18.fullfilepathscan
      if l_4_27 then
        l_4_27 = l_4_18.fullfilepathscan
        l_4_28 = split
        l_4_28 = l_4_28(l_4_27, ",")
        for l_4_43,l_4_44 in ipairs(l_4_28) do
          local l_4_45 = (string.lower)((MpCommon.Base64Decode)(l_4_44))
          if (string.find)(l_4_45, "\\windows defender\\support", 1, true) then
            pcall(ReportSupportLog)
          end
          local l_4_46 = (sysio.IsFileExists)(l_4_45)
          local l_4_47 = table.insert
          local l_4_48 = l_4_9.Processed
          local l_4_49 = {}
          l_4_49.fullfilepathscan = l_4_45
          l_4_47(l_4_48, l_4_49)
          l_4_47 = l_4_9.FullFilePathScan
          l_4_47[l_4_45], l_4_48 = l_4_48, {}
          l_4_47 = true
          if l_4_46 then
            l_4_48 = string
            l_4_48 = l_4_48.match
            l_4_49 = l_4_45
            l_4_48 = l_4_48(l_4_49, "(.-)[\\/][^\\/]*$")
            l_4_49 = l_4_9.FullFilePathScan
            l_4_49 = l_4_49[l_4_45]
            l_4_49.Exists = true
            l_4_49 = pcall
            l_4_49 = l_4_49(IsAVExcluded, l_4_48)
            do
              if IsAVExcluded == nil then
                local l_4_50, l_4_51, l_4_52 = false
              end
              -- DECOMPILER ERROR at PC278: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_4_9.FullFilePathScan)[l_4_45]).Excluded = (sysio.IsPathAVExcluded)(l_4_48, true)
              -- DECOMPILER ERROR at PC281: Confused about usage of register: R27 in 'UnsetPending'

              -- DECOMPILER ERROR at PC281: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_4_9.FullFilePathScan)[l_4_45]).Excluded_LUA_API = l_4_50
              -- DECOMPILER ERROR at PC287: Confused about usage of register: R27 in 'UnsetPending'

              if ((l_4_9.FullFilePathScan)[l_4_45]).Excluded == true and l_4_50 == true then
                l_4_47 = false
              end
              l_4_47 = false
              l_4_48 = l_4_9.FullFilePathScan
              l_4_48 = l_4_48[l_4_45]
              l_4_48.Exists = false
              l_4_48 = pcallEx
              l_4_49 = "AppendToRollingQueueNamespaced"
              l_4_48 = l_4_48(l_4_49, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_4_2, l_4_45, 1, l_4_6, 500, 1)
              do
                if not l_4_48 then
                  local l_4_53 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC324: Confused about usage of register: R28 in 'UnsetPending'

                  if l_4_53 and type(l_4_53) == "table" then
                    ((l_4_9.FullFilePathScan)[l_4_45]).RQErrors = safeJsonSerialize(l_4_53, 260)
                  end
                end
                if l_4_47 then
                  (mp.TriggerScanResource)("file", l_4_45, 0, 10000)
                  local l_4_54 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_4_54 then
                    local l_4_55 = l_4_54 .. "\\system32\\"
                    local l_4_56 = (sysio.GetProcessFromFileName)(l_4_55 .. "services.exe")
                    if #l_4_56 > 0 then
                      local l_4_57 = (string.format)("pid:%d,ProcessStart:%u", (l_4_56[1]).pid, (l_4_56[1]).starttime)
                      if l_4_57 then
                        (MpCommon.BmTriggerSig)(l_4_57, "hmdprecisionpulsefullfilepathscan_statuscheck", l_4_45)
                      end
                    end
                  end
                else
                  do
                    local l_4_58 = (sysio.GetFileSize)(l_4_45)
                    local l_4_59 = (sysio.GetFileLastWriteTime)(l_4_45)
                    -- DECOMPILER ERROR at PC380: Confused about usage of register: R29 in 'UnsetPending'

                    ;
                    ((l_4_9.FullFilePathScan)[l_4_45]).ExcludedFileInfo = {}
                    local l_4_60 = table.insert
                    local l_4_61 = ((l_4_9.FullFilePathScan)[l_4_45]).ExcludedFileInfo
                    local l_4_62 = {}
                    l_4_62.Size = l_4_58
                    l_4_62.LastModified = l_4_59
                    l_4_60(l_4_61, l_4_62)
                    l_4_60 = pcall
                    l_4_61 = CollectFile
                    l_4_62 = l_4_45
                    l_4_60 = l_4_60(l_4_61, l_4_62, l_4_58)
                    do
                      local l_4_63, l_4_64, l_4_65 = nil
                      -- DECOMPILER ERROR at PC401: Confused about usage of register: R35 in 'UnsetPending'

                      if l_4_60 then
                        if l_4_61 then
                          ((l_4_9.FullFilePathScan)[l_4_45]).Sha1 = l_4_62
                          -- DECOMPILER ERROR at PC404: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_4_9.FullFilePathScan)[l_4_45]).Sha256 = l_4_63
                          -- DECOMPILER ERROR at PC407: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_4_9.FullFilePathScan)[l_4_45]).PartialSha1 = l_4_64
                          -- DECOMPILER ERROR at PC410: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_4_9.FullFilePathScan)[l_4_45]).PartialSha256 = l_4_65
                          pcall(ReportResource, l_4_45, R38_PC417, (l_4_9.FullFilePathScan)[l_4_45])
                        else
                          -- DECOMPILER ERROR at PC421: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_4_9.FullFilePathScan)[l_4_45]).Error_Facility = l_4_62
                          -- DECOMPILER ERROR at PC424: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_4_9.FullFilePathScan)[l_4_45]).Error_Code = l_4_63
                        end
                      end
                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC425: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
      l_4_27 = l_4_18.scanfile
      if l_4_27 then
        l_4_27 = l_4_18.scanfile
        l_4_28 = split
        l_4_28 = l_4_28(l_4_27, ",")
        for l_4_69,l_4_70 in ipairs(l_4_28) do
          local l_4_71 = (string.lower)((MpCommon.Base64Decode)(l_4_70))
          local l_4_72 = table.insert
          local l_4_73 = l_4_9.Processed
          local l_4_74 = {}
          l_4_74.scanfile = l_4_71
          l_4_72(l_4_73, l_4_74)
          l_4_72 = AppendToRollingQueueNamespaced
          l_4_73 = "hmdprecisionpulsescanfile"
          l_4_74 = l_4_2
          l_4_72(l_4_73, l_4_74, l_4_71, 1, l_4_6, 500, 1)
        end
      end
      do
        do
          l_4_27 = l_4_18.enumeratefolder
          if l_4_27 then
            l_4_27 = 260
            l_4_28 = ""
            local l_4_75 = "*"
            local l_4_76 = 0
            local l_4_77 = true
            local l_4_78 = false
            local l_4_79 = l_4_18.enumeratefolder
            local l_4_80 = split(l_4_79, ",")
            local l_4_81 = 0
            for l_4_85,l_4_86 in ipairs(l_4_80) do
              l_4_81 = l_4_81 + 1
              -- DECOMPILER ERROR at PC487: Confused about usage of register: R29 in 'UnsetPending'

              if l_4_27 < l_4_81 then
                ((l_4_9.FolderEnumeration)[l_4_28]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_4_87 = (string.lower)((MpCommon.Base64Decode)(l_4_86))
              local l_4_88 = explode(l_4_87, "|")
              if #l_4_88 == 4 then
                l_4_28 = l_4_88[1]
                l_4_75 = l_4_88[2]
                l_4_76 = tonumber(l_4_88[3]) or 0
                l_4_77 = tonumber(l_4_88[4]) == 1
              elseif #l_4_88 == 5 then
                l_4_28 = l_4_88[1]
                l_4_75 = l_4_88[2]
                l_4_76 = tonumber(l_4_88[3]) or 0
                l_4_77 = tonumber(l_4_88[4]) == 1
                l_4_78 = tonumber(l_4_88[5]) == 1
              else
                l_4_28 = l_4_88[1]
              end
              if l_4_28 ~= nil then
                local l_4_89 = #l_4_28 + 2
                -- DECOMPILER ERROR at PC552: Confused about usage of register: R32 in 'UnsetPending'

                ;
                (l_4_9.FolderEnumeration)[l_4_28] = {}
                -- DECOMPILER ERROR at PC556: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_4_9.FolderEnumeration)[l_4_28]).Files = {}
                -- DECOMPILER ERROR at PC560: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_4_9.FolderEnumeration)[l_4_28]).Subfolders = {}
                local l_4_90 = (sysio.FindFiles)(l_4_28, l_4_75, l_4_76)
                local l_4_91 = (sysio.FindFolders)(l_4_28, "*", 0)
                if l_4_90 ~= nil then
                  local l_4_92 = 0
                  for R38_PC417,l_4_97 in pairs(l_4_90) do
                    l_4_92 = l_4_92 + 1
                    -- DECOMPILER ERROR at PC585: Confused about usage of register: R40 in 'UnsetPending'

                    if l_4_27 < l_4_92 then
                      ((l_4_9.FolderEnumeration)[l_4_28]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC589: Confused about usage of register: R40 in 'UnsetPending'

                      ;
                      ((l_4_9.FolderEnumeration)[l_4_28]).TotalFilesEnumerated = #l_4_90
                      break
                    end
                    local l_4_98 = (string.sub)(l_4_97, l_4_89)
                    if l_4_78 then
                      local l_4_99 = (sysio.GetFileSize)(l_4_97)
                      local l_4_100 = (sysio.GetFileLastWriteTime)(l_4_97)
                      local l_4_101 = table.insert
                      local l_4_102 = ((l_4_9.FolderEnumeration)[l_4_28]).Files
                      local l_4_103 = {}
                      l_4_103.Name = l_4_98
                      l_4_103.Size = l_4_99
                      l_4_103.LastModified = l_4_100
                      l_4_101(l_4_102, l_4_103)
                      l_4_92 = l_4_92 + 1
                    end
                    if l_4_77 then
                      local l_4_104 = l_4_8
                      local l_4_105 = (MpCommon.AtomicCounterAddNamespaced)(l_4_3, l_4_2, 1)
                      -- DECOMPILER ERROR at PC630: Confused about usage of register: R43 in 'UnsetPending'

                      if l_4_104 <= l_4_105 then
                        ((l_4_9.FolderEnumeration)[l_4_28]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_4_2, (string.lower)(l_4_97), 1, l_4_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_4_97), 0, 5000)
                      end
                    end
                  end
                end
                l_4_92 = table
                l_4_92 = l_4_92.insert
                local l_4_106 = nil
                l_4_106 = l_4_9.Processed
                local l_4_107 = nil
                local l_4_108 = nil
                l_4_92(l_4_106, l_4_107)
                l_4_107 = {enumeratefolder = l_4_28}
                l_4_92 = sysio
                l_4_92 = l_4_92.IsFolderExists
                l_4_106 = l_4_28
                l_4_92 = l_4_92(l_4_106)
                if l_4_92 then
                  l_4_106 = l_4_9.FolderEnumeration
                  l_4_106 = l_4_106[l_4_28]
                  l_4_106.Exists = true
                  l_4_106 = l_4_9.FolderEnumeration
                  l_4_106 = l_4_106[l_4_28]
                  l_4_107 = sysio
                  l_4_107 = l_4_107.IsPathAVExcluded
                  l_4_108 = l_4_28
                  l_4_107 = l_4_107(l_4_108, true)
                  l_4_106.Excluded = l_4_107
                else
                  l_4_106 = l_4_9.FolderEnumeration
                  l_4_106 = l_4_106[l_4_28]
                  l_4_106.Exists = false
                end
                if l_4_78 == false then
                  l_4_106 = #l_4_90
                  if l_4_106 <= l_4_27 then
                    l_4_106 = table
                    l_4_106 = l_4_106.insert
                    l_4_107 = l_4_9.FolderEnumeration
                    l_4_107 = l_4_107[l_4_28]
                    local l_4_109 = nil
                    l_4_106(l_4_107, l_4_108)
                    l_4_108 = {Files = l_4_90}
                  else
                    l_4_107 = 1
                    l_4_108 = l_4_27
                    for i = l_4_107, l_4_108 do
                      local l_4_112 = nil
                      l_4_112 = l_4_90[l_4_111]
                    end
                    local l_4_113 = nil
                    local l_4_114 = nil
                    local l_4_115 = nil
                    ;
                    (table.insert)((l_4_9.FolderEnumeration)[l_4_28], l_4_113)
                    l_4_113 = {Files = l_4_106}
                    -- DECOMPILER ERROR at PC714: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_4_9.FolderEnumeration)[l_4_28]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC718: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_4_9.FolderEnumeration)[l_4_28]).TotalFilesEnumerated = #l_4_90
                  end
                end
                -- DECOMPILER ERROR at PC721: Overwrote pending register: R35 in 'AssignReg'

                if l_4_91 ~= nil then
                  for l_4_119,l_4_120 in pairs(l_4_91) do
                    local l_4_119, l_4_120 = nil
                    -- DECOMPILER ERROR at PC726: Overwrote pending register: R35 in 'AssignReg'

                    if l_4_27 < l_4_106 then
                      break
                    end
                    l_4_119 = string
                    l_4_119 = l_4_119.sub
                    l_4_120 = l_4_118
                    l_4_119 = l_4_119(l_4_120, l_4_89)
                    local l_4_121 = nil
                    l_4_120 = table
                    l_4_120 = l_4_120.insert
                    l_4_121 = l_4_9.FolderEnumeration
                    l_4_121 = l_4_121[l_4_28]
                    l_4_121 = l_4_121.Subfolders
                    l_4_120(l_4_121, l_4_119)
                  end
                end
                -- DECOMPILER ERROR at PC744: Overwrote pending register: R35 in 'AssignReg'

                l_4_106("hmdprecisionpulseenumeratefolder", l_4_2, l_4_28, 1, l_4_6, 500, 1)
                -- DECOMPILER ERROR at PC753: Confused about usage of register R37 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_4_27 = l_4_18.enumerateregistrykey
          if l_4_27 then
            l_4_27 = ""
            l_4_28 = l_4_18.enumerateregistrykey
            l_4_75 = split
            l_4_76 = l_4_28
            l_4_77 = ","
            l_4_75 = l_4_75(l_4_76, l_4_77)
            local l_4_122 = nil
            l_4_76 = ipairs
            l_4_77 = l_4_75
            l_4_76 = l_4_76(l_4_77)
            for l_4_79,l_4_80 in l_4_76 do
              local l_4_123, l_4_124, l_4_125, l_4_126, l_4_127 = nil
              l_4_81 = string
              l_4_81 = l_4_81.lower
              l_4_81 = l_4_81((MpCommon.Base64Decode)(l_4_80))
              local l_4_128 = nil
              l_4_27 = l_4_81
              if l_4_27 ~= nil then
                local l_4_129 = nil
                -- DECOMPILER ERROR at PC784: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC788: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC792: Confused about usage of register: R25 in 'UnsetPending'

                local l_4_130 = nil
                local l_4_131 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_4_27)) ~= nil then
                  (table.insert)(((l_4_9.RegkeyEnumeration)[l_4_27]).Keys, l_4_87)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_4_27)) ~= nil then
                    for l_4_88,l_4_89 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_4_27))) do
                      local l_4_132, l_4_133, l_4_134, l_4_135, l_4_136 = nil
                      l_4_90 = sysio
                      l_4_90 = l_4_90.GetRegValueType
                      l_4_91 = (sysio.RegOpenKey)(l_4_27)
                      l_4_92 = l_4_89
                      l_4_90 = (l_4_90(l_4_91, l_4_92))
                      local l_4_137 = nil
                      l_4_91 = nil
                      local l_4_138 = nil
                      if l_4_90 == 1 then
                        l_4_92 = sysio
                        l_4_92 = l_4_92.GetRegValueAsString
                        -- DECOMPILER ERROR at PC826: Overwrote pending register: R35 in 'AssignReg'

                        l_4_92 = l_4_92(l_4_106, l_4_89)
                        l_4_91 = l_4_92 or "Value not set"
                        l_4_92 = l_4_9.RegkeyEnumeration
                        l_4_92 = l_4_92[l_4_27]
                        l_4_92 = l_4_92.Values
                        l_4_92[l_4_89], l_4_106 = l_4_106, {}
                        l_4_92 = table
                        l_4_92 = l_4_92.insert
                        l_4_106 = l_4_9.RegkeyEnumeration
                        l_4_106 = l_4_106[l_4_27]
                        l_4_106 = l_4_106.Values
                        l_4_106 = l_4_106[l_4_89]
                        l_4_92(l_4_106, (l_4_91) .. l_4_122)
                      elseif l_4_90 == 2 then
                        l_4_92 = sysio
                        l_4_92 = l_4_92.GetRegValueAsString
                        l_4_106 = (sysio.RegOpenKey)(l_4_27)
                        l_4_92 = l_4_92(l_4_106, l_4_89)
                        l_4_91 = l_4_92 or "Value not set"
                        l_4_92 = l_4_9.RegkeyEnumeration
                        l_4_92 = l_4_92[l_4_27]
                        l_4_92 = l_4_92.Values
                        l_4_92[l_4_89], l_4_106 = l_4_106, {}
                        l_4_92 = table
                        l_4_92 = l_4_92.insert
                        l_4_106 = l_4_9.RegkeyEnumeration
                        l_4_106 = l_4_106[l_4_27]
                        l_4_106 = l_4_106.Values
                        l_4_106 = l_4_106[l_4_89]
                        -- DECOMPILER ERROR at PC870: Overwrote pending register: R37 in 'AssignReg'

                        l_4_92(l_4_106, (l_4_91) .. l_4_122)
                      elseif l_4_90 == 3 then
                        l_4_92 = sysio
                        l_4_92 = l_4_92.GetRegValueAsBinary
                        l_4_106 = (sysio.RegOpenKey)(l_4_27)
                        l_4_92 = l_4_92(l_4_106, l_4_89)
                        l_4_91 = l_4_92 or "Value not set"
                        l_4_92 = l_4_9.RegkeyEnumeration
                        l_4_92 = l_4_92[l_4_27]
                        l_4_92 = l_4_92.Values
                        l_4_92[l_4_89], l_4_106 = l_4_106, {}
                        l_4_92 = table
                        l_4_92 = l_4_92.insert
                        l_4_106 = l_4_9.RegkeyEnumeration
                        l_4_106 = l_4_106[l_4_27]
                        l_4_106 = l_4_106.Values
                        l_4_106 = l_4_106[l_4_89]
                        -- DECOMPILER ERROR at PC896: Overwrote pending register: R37 in 'AssignReg'

                        l_4_92(l_4_106, (l_4_91) .. l_4_122)
                      elseif l_4_90 == 4 then
                        l_4_92 = sysio
                        l_4_92 = l_4_92.GetRegValueAsDword
                        l_4_106 = (sysio.RegOpenKey)(l_4_27)
                        l_4_92 = l_4_92(l_4_106, l_4_89)
                        l_4_91 = l_4_92 or "Value not set"
                        l_4_92 = l_4_9.RegkeyEnumeration
                        l_4_92 = l_4_92[l_4_27]
                        l_4_92 = l_4_92.Values
                        l_4_92[l_4_89], l_4_106 = l_4_106, {}
                        l_4_92 = table
                        l_4_92 = l_4_92.insert
                        l_4_106 = l_4_9.RegkeyEnumeration
                        l_4_106 = l_4_106[l_4_27]
                        l_4_106 = l_4_106.Values
                        l_4_106 = l_4_106[l_4_89]
                        -- DECOMPILER ERROR at PC922: Overwrote pending register: R37 in 'AssignReg'

                        l_4_92(l_4_106, (l_4_91) .. l_4_122)
                      elseif l_4_90 == 7 then
                        l_4_92 = sysio
                        l_4_92 = l_4_92.GetRegValueAsMultiString
                        l_4_106 = (sysio.RegOpenKey)(l_4_27)
                        l_4_92 = l_4_92(l_4_106, l_4_89)
                        l_4_91 = l_4_92 or "Value not set"
                        l_4_92 = l_4_9.RegkeyEnumeration
                        l_4_92 = l_4_92[l_4_27]
                        l_4_92 = l_4_92.Values
                        l_4_92[l_4_89], l_4_106 = l_4_106, {}
                        l_4_92 = ipairs
                        l_4_106 = l_4_91
                        l_4_92 = l_4_92(l_4_106)
                        for l_4_122,l_4_123 in l_4_92 do
                          local l_4_139, l_4_140, l_4_141, l_4_142, l_4_143 = nil
                          l_4_124 = table
                          l_4_124 = l_4_124.insert
                          l_4_125 = l_4_9.RegkeyEnumeration
                          l_4_125 = l_4_125[l_4_27]
                          l_4_125 = l_4_125.Values
                          l_4_125 = l_4_125[l_4_89]
                          l_4_126 = l_4_123
                          l_4_127 = " (REG_MULTI_SZ)"
                          l_4_126 = l_4_126 .. l_4_127
                          l_4_124(l_4_125, l_4_126)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_4_27), l_4_89) then
                          l_4_91 = l_4_90 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC972: Confused about usage of register: R34 in 'UnsetPending'

                        ;
                        (((l_4_9.RegkeyEnumeration)[l_4_27]).Values)[l_4_89] = {}
                        -- DECOMPILER ERROR at PC980: Overwrote pending register: R37 in 'AssignReg'

                        ;
                        (table.insert)((((l_4_9.RegkeyEnumeration)[l_4_27]).Values)[l_4_89], (l_4_91) .. l_4_122)
                      end
                      l_4_91 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_4_27), l_4_89) or "Value not set"
                      -- DECOMPILER ERROR at PC996: Confused about usage of register: R34 in 'UnsetPending'

                      ;
                      (((l_4_9.RegkeyEnumeration)[l_4_27]).Values)[l_4_89] = {}
                      ;
                      (table.insert)((((l_4_9.RegkeyEnumeration)[l_4_27]).Values)[l_4_89], (l_4_91) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_4_144 = nil
                local l_4_145 = nil
                local l_4_146 = nil
                ;
                (table.insert)(l_4_9.Processed, {enumerateregistrykey = l_4_27})
              end
            end
            -- DECOMPILER ERROR at PC1017: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          end
          l_4_27 = l_4_18.deleteregistryvalue
          if l_4_27 then
            l_4_27 = ""
            l_4_28 = l_4_18.deleteregistryvalue
            l_4_75 = split
            l_4_75 = l_4_75(l_4_28, ",")
            local l_4_147 = nil
            for l_4_151,l_4_152 in ipairs(l_4_75) do
              local l_4_148, l_4_149, l_4_150, l_4_151, l_4_152 = nil
              l_4_81 = string
              l_4_81 = l_4_81.lower
              -- DECOMPILER ERROR at PC1034: Confused about usage of register: R22 in 'UnsetPending'

              l_4_81 = l_4_81((MpCommon.Base64Decode)(l_4_80))
              local l_4_153 = nil
              if l_4_27 ~= nil then
                l_4_27 = explode(l_4_81, "|")
                if #l_4_27 == 2 then
                  local l_4_154 = nil
                  local l_4_155 = nil
                  -- DECOMPILER ERROR at PC1051: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1054: Confused about usage of register: R24 in 'UnsetPending'

                  local l_4_156 = nil
                  if (sysio.RegOpenKey)(l_4_27[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1065: Confused about usage of register: R24 in 'UnsetPending'

                    local l_4_157 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_4_2, (string.format)("%s\\\\%s", l_4_27[1], l_4_27[2]), l_4_90, l_4_91, 500, 1)
                    -- DECOMPILER ERROR at PC1082: Overwrote pending register: R32 in 'AssignReg'

                    local l_4_158, l_4_159 = nil
                    -- DECOMPILER ERROR at PC1087: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1087: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_4_90)
                    -- DECOMPILER ERROR at PC1091: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1092: Overwrote pending register: R33 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_4_90, l_4_91, 1, l_4_6, 500, 1)
                    -- DECOMPILER ERROR at PC1101: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1102: Overwrote pending register: R33 in 'AssignReg'

                    local l_4_160, l_4_161 = nil
                    -- DECOMPILER ERROR at PC1105: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1106: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1107: Overwrote pending register: R33 in 'AssignReg'

                    l_4_90(l_4_91, (string.format)("%s\\\\%s", l_4_27[1], l_4_27[2]))
                  else
                    -- DECOMPILER ERROR at PC1112: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1112: Confused about usage of register: R27 in 'UnsetPending'

                  end
                  local l_4_162 = nil
                  -- DECOMPILER ERROR at PC1115: Overwrote pending register: R28 in 'AssignReg'

                  local l_4_163 = nil
                  local l_4_164 = nil
                  -- DECOMPILER ERROR at PC1117: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1117: Overwrote pending register: R30 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1119: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1119: Overwrote pending register: R32 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_4_2, l_4_90), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_4_90, l_4_91, (string.format)("%s\\\\%s", l_4_27[1], l_4_27[2])) .. " " .. l_4_90})
                end
              end
            end
          end
          l_4_27 = l_4_18.process
          if l_4_27 then
            l_4_27 = mp
            l_4_27 = l_4_27.get_contextdata
            l_4_28 = mp
            l_4_28 = l_4_28.CONTEXT_DATA_PROCESS_PPID
            l_4_27 = l_4_27(l_4_28)
            if l_4_27 == nil then
              l_4_28 = MpCommon
              l_4_28 = l_4_28.ExpandEnvironmentVariables
              l_4_75 = "%windir%"
              l_4_28 = l_4_28(l_4_75)
              l_4_75 = l_4_28
              l_4_75 = l_4_75 .. "\\system32\\"
              local l_4_165 = nil
              local l_4_166 = nil
              if #(sysio.GetProcessFromFileName)(l_4_75 .. "services.exe") > 0 then
                l_4_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_4_75 .. "services.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_4_75 .. "services.exe"))[1]).starttime)
              end
            end
            l_4_28 = table
            l_4_28 = l_4_28.insert
            l_4_75 = l_4_9.Processed
            local l_4_167 = nil
            local l_4_168 = nil
            l_4_28(l_4_75, {process = l_4_18.process})
            l_4_28 = MpCommon
            l_4_28 = l_4_28.BmTriggerSig
            l_4_75 = l_4_27
            l_4_28(l_4_75, "Heimdall_ProcessDispatch", l_4_18.process)
          end
          l_4_27 = l_4_18.firewall
          if l_4_27 then
            l_4_27 = l_4_18.firewall
            l_4_28 = split
            l_4_75 = l_4_27
            l_4_28 = l_4_28(l_4_75, ",")
            l_4_75 = ipairs
            l_4_75 = l_4_75(l_4_28)
            for l_4_172,l_4_173 in l_4_75 do
              local l_4_169, l_4_170, l_4_171, l_4_172, l_4_173 = nil
              -- DECOMPILER ERROR at PC1187: Confused about usage of register: R21 in 'UnsetPending'

              local l_4_174 = nil
              -- DECOMPILER ERROR at PC1191: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1192: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_4_81) then
                local l_4_175 = nil
                local l_4_176 = nil
                local l_4_177 = nil
                l_4_81(l_4_9.Processed, {firewall = (MpCommon.Base64Decode)(l_4_81)})
                -- DECOMPILER ERROR at PC1197: Overwrote pending register: R23 in 'AssignReg'

                l_4_81 = l_4_81((MpCommon.Base64Decode)(l_4_81), "_")
                l_4_81 = #l_4_81
                if l_4_81 == 3 then
                  l_4_81 = tonumber
                  -- DECOMPILER ERROR at PC1206: Confused about usage of register: R22 in 'UnsetPending'

                  l_4_81 = l_4_81(l_4_81[2])
                  -- DECOMPILER ERROR at PC1210: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1212: Confused about usage of register: R22 in 'UnsetPending'

                  local l_4_178 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_4_81[1], tonumber(l_4_81[3]), (mp.bitand)(l_4_81, 2) == 2, (mp.bitand)(l_4_81, 1) == 1)
                end
              end
            end
          end
          l_4_27 = l_4_18.sinkholedns
          if l_4_27 then
            l_4_27 = l_4_18.sinkholedns
            l_4_28 = split
            l_4_28 = l_4_28(l_4_27, ",")
            for l_4_187,l_4_188 in ipairs(l_4_28) do
              local l_4_184, l_4_185, l_4_186, l_4_187, l_4_188 = nil
              -- DECOMPILER ERROR at PC1249: Confused about usage of register: R21 in 'UnsetPending'

              local l_4_189 = nil
              -- DECOMPILER ERROR at PC1251: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1252: Overwrote pending register: R23 in 'AssignReg'

              local l_4_190 = nil
              local l_4_191 = nil
              local l_4_192 = nil
              l_4_81(l_4_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_4_81)})
              -- DECOMPILER ERROR at PC1259: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_4_81) then
                l_4_81 = l_4_81((MpCommon.Base64Decode)(l_4_81), "_")
                -- DECOMPILER ERROR at PC1265: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC1268: Confused about usage of register: R22 in 'UnsetPending'

                l_4_81 = l_4_81(l_4_81[1], tonumber(l_4_81[2]))
                -- DECOMPILER ERROR at PC1273: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1275: Confused about usage of register: R22 in 'UnsetPending'

                local l_4_193 = nil
                l_4_9["sinkholedns" .. "_" .. l_4_81[1] .. "_" .. l_4_81[2]] = {res = l_4_81, isAllowed = l_4_81[1]}
              end
            end
          end
          l_4_27 = l_4_18.dnscache
          if l_4_27 then
            l_4_27 = l_4_18.dnscache
            l_4_28 = split
            l_4_28 = l_4_28(l_4_27, ",")
            for l_4_197,l_4_198 in ipairs(l_4_28) do
              local l_4_194, l_4_195, l_4_196, l_4_197, l_4_198 = nil
              -- DECOMPILER ERROR at PC1297: Confused about usage of register: R21 in 'UnsetPending'

              local l_4_199 = nil
              -- DECOMPILER ERROR at PC1299: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1300: Overwrote pending register: R23 in 'AssignReg'

              local l_4_200 = nil
              local l_4_201 = nil
              local l_4_202 = nil
              l_4_81(l_4_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_4_81)})
              -- DECOMPILER ERROR at PC1307: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_4_81) then
                l_4_81 = l_4_81((MpCommon.Base64Decode)(l_4_81), "_")
                for i_1,i_2 in ipairs(l_4_81) do
                  local l_4_203, l_4_204, l_4_205 = nil
                  l_4_9["dnscache" .. "_" .. i_2], l_4_81 = l_4_81, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_4_27 = l_4_18.debug
          if l_4_27 then
            l_4_27 = l_4_18.debug
            l_4_28 = split
            l_4_28 = l_4_28(l_4_27, ",")
            local l_4_206 = nil
            for l_4_210,l_4_211 in ipairs(l_4_28) do
              local l_4_207, l_4_208, l_4_209, l_4_210, l_4_211 = nil
              l_4_81 = MpCommon
              l_4_81 = l_4_81.Base64Decode
              -- DECOMPILER ERROR at PC1346: Confused about usage of register: R22 in 'UnsetPending'

              l_4_81 = l_4_81(l_4_81)
              local l_4_212 = nil
              local l_4_213 = nil
              local l_4_214 = nil
              local l_4_215 = nil
              ;
              (table.insert)(l_4_9.Processed, {debug = l_4_81})
              for l_4_219,l_4_220 in ipairs((split(l_4_81, "_"))) do
                local l_4_216, l_4_217, l_4_218, l_4_219, l_4_220 = nil
                -- DECOMPILER ERROR at PC1363: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1364: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1364: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1368: Overwrote pending register: R25 in 'AssignReg'

                -- DECOMPILER ERROR at PC1369: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1369: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1372: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1372: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1373: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1375: Overwrote pending register: R32 in 'AssignReg'

                if nil == "PC" then
                  local l_4_221 = nil
                  -- DECOMPILER ERROR at PC1376: Overwrote pending register: R33 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1380: Confused about usage of register: R26 in 'UnsetPending'

                  l_4_91 = l_4_91(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1385: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1387: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1387: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PCNP" then
                    l_4_91 = ":"
                    -- DECOMPILER ERROR at PC1389: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1390: Overwrote pending register: R32 in 'AssignReg'

                    local l_4_222 = nil
                    l_4_91 = table_pack
                    -- DECOMPILER ERROR at PC1395: Confused about usage of register: R26 in 'UnsetPending'

                    l_4_91 = l_4_91(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1400: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1402: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1402: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "RQ" then
                      l_4_91 = ":"
                      -- DECOMPILER ERROR at PC1404: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1405: Overwrote pending register: R32 in 'AssignReg'

                      local l_4_223 = nil
                      l_4_91 = table_pack
                      -- DECOMPILER ERROR at PC1410: Confused about usage of register: R26 in 'UnsetPending'

                      l_4_91 = l_4_91(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1415: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1417: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1417: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "AC" then
                        l_4_91 = ":"
                        -- DECOMPILER ERROR at PC1419: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1420: Overwrote pending register: R32 in 'AssignReg'

                        local l_4_224 = nil
                        l_4_91 = table_pack
                        -- DECOMPILER ERROR at PC1425: Confused about usage of register: R26 in 'UnsetPending'

                        l_4_91 = l_4_91(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_4_9.debug = {[l_4_90] = l_4_91, [l_4_90] = l_4_91, [l_4_90] = l_4_91, [l_4_90] = l_4_91}
          end
          l_4_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_4_10.report = safeJsonSerialize(l_4_9, 260)
          l_4_10.TAG = "NOLOOKUP"
          pcall(mp.GetUrlReputation, l_4_28, l_4_10)
          -- DECOMPILER ERROR at PC1449: Confused about usage of register R37 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


