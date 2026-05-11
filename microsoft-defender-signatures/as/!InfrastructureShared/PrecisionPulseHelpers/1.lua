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
          l_1_16(l_1_17, l_1_11, l_1_13, "LUA")
        else
          do
            local l_1_18 = nil
            local l_1_19 = ReportResource
            local l_1_20 = l_1_9
            do
              local l_1_21 = ""
              l_1_19(l_1_20, l_1_21, {Facility = l_1_18.Facility, Code = l_1_18.Code}, "LUA")
              -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out DO_STMT

              -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_ELSE_STMT

              -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_STMT

              -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_THEN_STMT

              -- DECOMPILER ERROR at PC106: LeaveBlock: unexpected jumping out IF_STMT

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
  do
    if l_2_2 then
      local l_2_3, l_2_4 = 2086912 * 10
    end
    local l_2_5 = nil
    -- DECOMPILER ERROR at PC22: Overwrote pending register: R4 in 'AssignReg'

    -- DECOMPILER ERROR at PC30: Overwrote pending register: R4 in 'AssignReg'

    if l_2_5 < l_2_1 then
      local l_2_6 = nil
      if not ((sysio.GetLastResult)()).Success then
        return nil, ((sysio.GetLastResult)()).Facility, ((sysio.GetLastResult)()).Code
      end
      local l_2_7, l_2_8, l_2_9, l_2_10 = , nil, nil, nil
      -- DECOMPILER ERROR at PC57: Overwrote pending register: R9 in 'AssignReg'

      -- DECOMPILER ERROR at PC84: Overwrote pending register: R4 in 'AssignReg'

      if l_2_5 >= l_2_1 or l_2_6 then
        return l_2_6, l_2_8, l_2_9, l_2_10, nil
      end
      return 
    end
  end
end

local l_0_0 = function(l_3_0, l_3_1, l_3_2)
  -- function num : 0_2
  local l_3_3 = 1
  local l_3_4 = 0
  local l_3_5 = #l_3_1
  local l_3_6 = 0
  local l_3_7 = 64500
  local l_3_8 = 1000
  local l_3_9 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  while 1 do
    if l_3_3 <= l_3_5 then
      local l_3_10 = l_3_1:sub(l_3_3, l_3_3 + l_3_8 - 1)
      local l_3_11 = #l_3_10
    end
    if l_3_7 < l_3_6 + l_3_11 then
      break
    end
    l_3_0["ResourceContent_" .. l_3_4] = l_3_10
    l_3_6 = l_3_6 + l_3_11
    l_3_3 = l_3_3 + l_3_8
    l_3_4 = l_3_4 + 1
  end
  do
    local l_3_12 = {}
    l_3_12[1] = l_3_9 .. "?indx=" .. l_3_2
    return SafeGetUrlReputation(l_3_12, l_3_0, false, 2000 + l_3_2 * 500, false, false)
  end
end

ReportResource = function(l_4_0, l_4_1, l_4_2, l_4_3)
  -- function num : 0_3 , upvalues : l_0_0
  if not l_4_2 then
    l_4_2 = {}
  end
  if not l_4_1 or not l_4_0 then
    return 
  end
  local l_4_4 = 64500
  local l_4_5 = 320
  local l_4_6 = #l_4_1
  local l_4_7 = 1
  local l_4_8 = 0
  local l_4_9 = {}
  l_4_9.SIG_CONTEXT = "Lua_Custom_Upload_Resource"
  l_4_9.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_4_9.TAG = "NOLOOKUP"
  l_4_9.ResourceName = l_4_0
  l_4_9.ResourceInfo = safeJsonSerialize(l_4_2)
  l_4_9.Source = l_4_3
  while l_4_7 <= l_4_6 and l_4_8 < l_4_5 do
    l_4_9.Index = l_4_8
    local l_4_10 = l_4_1:sub(l_4_7, l_4_7 + l_4_4 - 1)
    l_4_7 = l_4_7 + l_4_4
    pcall(l_0_0, l_4_9, l_4_10, l_4_8)
    l_4_8 = l_4_8 + 1
  end
end

MamadutReport = function()
  -- function num : 0_4
  local l_5_0 = reportRelevantUntrustedEntities(0)
  if l_5_0 and next(l_5_0) then
    (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_5_0), bm.RelatedStringBMReport)
    local l_5_1 = {}
    -- DECOMPILER ERROR at PC51: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC52: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

    for l_5_5,l_5_6 in (".dll")(".jar") do
      -- DECOMPILER ERROR at PC56: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC58: Overwrote pending register: R8 in 'AssignReg'

      if ((".html").IsFileExists)(".pdb") then
        local l_5_7 = true
        -- DECOMPILER ERROR at PC64: Overwrote pending register: R9 in 'AssignReg'

        -- DECOMPILER ERROR at PC65: Overwrote pending register: R10 in 'AssignReg'

        -- DECOMPILER ERROR at PC73: Overwrote pending register: R11 in 'AssignReg'

        if Contains_any_caseinsenstive(".7z", ".xz") and (not (string.find)(l_5_6, ".dll", ".001", true) or (mp.IsKnownFriendlyFile)(l_5_6, true, false) ~= true or l_5_7) then
          local l_5_8 = (sysio.GetFileSize)(l_5_6)
          local l_5_9 = (sysio.GetFileLastWriteTime)(l_5_6)
          local l_5_10 = {}
          -- DECOMPILER ERROR at PC102: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC103: Overwrote pending register: R14 in 'AssignReg'

          local l_5_11, l_5_12, l_5_13, l_5_14, l_5_15, l_5_16 = pcall(CollectFile, ".zip", ".rar", true), ".cpp"
          -- DECOMPILER ERROR at PC114: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC115: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC116: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC117: Overwrote pending register: R20 in 'AssignReg'

          -- DECOMPILER ERROR at PC118: Overwrote pending register: R21 in 'AssignReg'

          if l_5_11 then
            if l_5_12 then
              (".cs")(".c", ".csproj", ".sln", ".ps1")
              ;
              (bm.add_related_string)("FileReported_" .. l_5_6, safeJsonSerialize(l_5_10), bm.RelatedStringBMReport)
            else
              ;
              (bm.add_related_string)("FileReadFailed_" .. l_5_6, safeJsonSerialize(l_5_10), bm.RelatedStringBMReport)
            end
          end
        end
      end
    end
  end
  do
    do
      local l_5_17, l_5_18 = nil
      -- DECOMPILER ERROR at PC155: Overwrote pending register: R3 in 'AssignReg'

      if not l_5_1 and l_5_17 then
        l_5_18("bmInfoFailReason", tostring(l_5_17), bm.RelatedStringBMReport)
      end
      -- DECOMPILER ERROR at PC163: Overwrote pending register: R3 in 'AssignReg'

      l_5_18()
      -- DECOMPILER ERROR at PC165: Overwrote pending register: R3 in 'AssignReg'

      l_5_18()
      -- DECOMPILER ERROR at PC167: Overwrote pending register: R3 in 'AssignReg'

      l_5_18()
      do return  end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

EnablePrecisionPulse = function(l_6_0, l_6_1, l_6_2, l_6_3, l_6_4)
  -- function num : 0_5
  local l_6_5 = 60
  local l_6_6 = 300
  local l_6_7 = nil
  local l_6_8 = 500
  local l_6_9 = {}
  l_6_9.Processed = {}
  l_6_9.FolderEnumeration = {}
  l_6_9.ScanPath = {}
  l_6_9.FullFilePathScan = {}
  l_6_9.RegkeyEnumeration = {}
  l_6_9.DeleteRegValue = {}
  local l_6_10 = {}
  l_6_10.SIG_CONTEXT = "LUA_GENERIC"
  l_6_10.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_6_10.TAG = "NOLOOKUP"
  local l_6_11 = {}
  for l_6_15 in l_6_0:gmatch("[^%+][^%+]+") do
    local l_6_16, l_6_17 = l_6_15:match("(.+)::(.+)")
    if l_6_16 and l_6_17 then
      l_6_11[l_6_16] = l_6_17
    end
  end
  local l_6_18 = {}
  local l_6_19 = l_6_11
  for l_6_23,l_6_24 in pairs(l_6_19) do
    local l_6_25 = l_6_23
    l_6_18[l_6_25] = l_6_24
  end
  if l_6_18.tracking_id then
    l_6_7 = l_6_18.tracking_id
  end
  if l_6_7 == nil then
    l_6_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_6_26 = table.insert
  local l_6_27 = l_6_9.Processed
  local l_6_28 = {}
  l_6_28.TrackingId = l_6_7
  l_6_26(l_6_27, l_6_28)
  l_6_26 = l_6_18.ttl
  if l_6_26 then
    l_6_6 = l_6_18.ttl
    l_6_26 = table
    l_6_26 = l_6_26.insert
    l_6_27 = l_6_9.Processed
    l_6_26(l_6_27, l_6_28)
    l_6_28 = {Ttl = l_6_6}
  end
  l_6_26 = l_6_18.suppress_ttl
  if l_6_26 then
    l_6_5 = l_6_18.suppress_ttl
    l_6_26 = table
    l_6_26 = l_6_26.insert
    l_6_27 = l_6_9.Processed
    l_6_26(l_6_27, l_6_28)
    l_6_28 = {suppress_ttl = l_6_5}
  end
  l_6_26 = MpCommon
  l_6_26 = l_6_26.AtomicCounterValueNamespaced
  l_6_27 = l_6_3
  l_6_28 = l_6_2
  l_6_26 = l_6_26(l_6_27, l_6_28)
  if l_6_26 == nil then
    l_6_27 = MpCommon
    l_6_27 = l_6_27.AtomicCounterSetNamespaced
    l_6_28 = l_6_3
    l_6_27(l_6_28, l_6_2, 0, l_6_5)
  end
  l_6_27 = l_6_18.maxscan
  if l_6_27 then
    l_6_27 = tonumber
    l_6_28 = l_6_18.maxscan
    l_6_27 = l_6_27(l_6_28)
    l_6_8 = l_6_27 or 500
    l_6_27 = MpCommon
    l_6_27 = l_6_27.AtomicCounterValueNamespaced
    l_6_28 = l_6_4
    l_6_27 = l_6_27(l_6_28, l_6_2)
    if l_6_27 == nil then
      l_6_28 = MpCommon
      l_6_28 = l_6_28.AtomicCounterSetNamespaced
      l_6_28(l_6_4, l_6_2, l_6_8, l_6_6)
    else
      l_6_28 = MpCommon
      l_6_28 = l_6_28.AtomicCounterSubNamespaced
      l_6_28(l_6_4, l_6_2, l_6_27)
      l_6_28 = MpCommon
      l_6_28 = l_6_28.AtomicCounterAddNamespaced
      l_6_28(l_6_4, l_6_2, l_6_8)
    end
    l_6_28 = table
    l_6_28 = l_6_28.insert
    local l_6_29 = l_6_9.Processed
    local l_6_30 = {}
    l_6_30.max_scan = l_6_8
    l_6_28(l_6_29, l_6_30)
  end
  do
    l_6_27 = l_6_18.scanpath
    if l_6_27 then
      l_6_27 = l_6_18.scanpath
      l_6_28 = split
      l_6_28 = l_6_28(l_6_27, ",")
      for l_6_34,l_6_35 in ipairs(l_6_28) do
        local l_6_36 = (string.lower)((MpCommon.Base64Decode)(l_6_35))
        local l_6_37 = table.insert
        local l_6_38 = l_6_9.Processed
        local l_6_39 = {}
        l_6_39.scanpath = l_6_36
        l_6_37(l_6_38, l_6_39)
        l_6_37 = AppendToRollingQueueNamespaced
        l_6_38 = "hmdprecisionpulsefolderscan"
        l_6_39 = l_6_2
        l_6_37(l_6_38, l_6_39, l_6_36, 1, l_6_6, 500, 1)
        l_6_37 = mp
        l_6_37 = l_6_37.TriggerScanResource
        l_6_38 = "folder"
        l_6_39 = l_6_36
        l_6_37(l_6_38, l_6_39, 0, 5000)
        l_6_37 = l_6_9.ScanPath
        l_6_37[l_6_36], l_6_38 = l_6_38, {}
        l_6_37 = table
        l_6_37 = l_6_37.insert
        l_6_38 = l_6_9.Processed
        l_6_37(l_6_38, l_6_39)
        l_6_39 = {scanpath = l_6_36}
        l_6_37 = sysio
        l_6_37 = l_6_37.IsFolderExists
        l_6_38 = l_6_36
        l_6_37 = l_6_37(l_6_38)
        if l_6_37 then
          l_6_38 = l_6_9.ScanPath
          l_6_38 = l_6_38[l_6_36]
          l_6_38.Exists = true
          l_6_38 = l_6_9.ScanPath
          l_6_38 = l_6_38[l_6_36]
          l_6_39 = sysio
          l_6_39 = l_6_39.IsPathAVExcluded
          l_6_39 = l_6_39(l_6_36, true)
          l_6_38.Excluded = l_6_39
        else
          l_6_38 = l_6_9.ScanPath
          l_6_38 = l_6_38[l_6_36]
          l_6_38.Exists = false
        end
      end
    end
    do
      l_6_27 = l_6_18.fullfilepathscan
      if l_6_27 then
        l_6_27 = l_6_18.fullfilepathscan
        l_6_28 = split
        l_6_28 = l_6_28(l_6_27, ",")
        for l_6_43,l_6_44 in ipairs(l_6_28) do
          local l_6_45 = (string.lower)((MpCommon.Base64Decode)(l_6_44))
          if (string.find)(l_6_45, "\\windows defender\\support", 1, true) then
            pcall(ReportSupportLog)
          end
          local l_6_46 = (sysio.IsFileExists)(l_6_45)
          local l_6_47 = table.insert
          local l_6_48 = l_6_9.Processed
          local l_6_49 = {}
          l_6_49.fullfilepathscan = l_6_45
          l_6_47(l_6_48, l_6_49)
          l_6_47 = l_6_9.FullFilePathScan
          l_6_47[l_6_45], l_6_48 = l_6_48, {}
          l_6_47 = true
          if l_6_46 then
            l_6_48 = string
            l_6_48 = l_6_48.match
            l_6_49 = l_6_45
            l_6_48 = l_6_48(l_6_49, "(.-)[\\/][^\\/]*$")
            l_6_49 = l_6_9.FullFilePathScan
            l_6_49 = l_6_49[l_6_45]
            l_6_49.Exists = true
            l_6_49 = pcall
            l_6_49 = l_6_49(IsAVExcluded, l_6_48)
            do
              if IsAVExcluded == nil then
                local l_6_50, l_6_51, l_6_52 = false
              end
              -- DECOMPILER ERROR at PC278: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_6_9.FullFilePathScan)[l_6_45]).Excluded = (sysio.IsPathAVExcluded)(l_6_48, true)
              -- DECOMPILER ERROR at PC281: Confused about usage of register: R27 in 'UnsetPending'

              -- DECOMPILER ERROR at PC281: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_6_9.FullFilePathScan)[l_6_45]).Excluded_LUA_API = l_6_50
              -- DECOMPILER ERROR at PC287: Confused about usage of register: R27 in 'UnsetPending'

              if ((l_6_9.FullFilePathScan)[l_6_45]).Excluded == true and l_6_50 == true then
                l_6_47 = false
              end
              l_6_47 = false
              l_6_48 = l_6_9.FullFilePathScan
              l_6_48 = l_6_48[l_6_45]
              l_6_48.Exists = false
              l_6_48 = pcallEx
              l_6_49 = "AppendToRollingQueueNamespaced"
              l_6_48 = l_6_48(l_6_49, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_6_2, l_6_45, 1, l_6_6, 500, 1)
              do
                if not l_6_48 then
                  local l_6_53 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC324: Confused about usage of register: R28 in 'UnsetPending'

                  if l_6_53 and type(l_6_53) == "table" then
                    ((l_6_9.FullFilePathScan)[l_6_45]).RQErrors = safeJsonSerialize(l_6_53, 260)
                  end
                end
                if l_6_47 then
                  (mp.TriggerScanResource)("file", l_6_45, 0, 10000)
                  local l_6_54 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_6_54 then
                    local l_6_55 = l_6_54 .. "\\system32\\"
                    local l_6_56 = (sysio.GetProcessFromFileName)(l_6_55 .. "services.exe")
                    if #l_6_56 > 0 then
                      local l_6_57 = (string.format)("pid:%d,ProcessStart:%u", (l_6_56[1]).pid, (l_6_56[1]).starttime)
                      if l_6_57 then
                        (MpCommon.BmTriggerSig)(l_6_57, "hmdprecisionpulsefullfilepathscan_statuscheck", l_6_45)
                      end
                    end
                  end
                else
                  do
                    if l_6_46 then
                      local l_6_58 = (sysio.GetFileSize)(l_6_45)
                      local l_6_59 = (sysio.GetFileLastWriteTime)(l_6_45)
                      -- DECOMPILER ERROR at PC382: Confused about usage of register: R29 in 'UnsetPending'

                      ;
                      ((l_6_9.FullFilePathScan)[l_6_45]).ExcludedFileInfo = {}
                      local l_6_60 = table.insert
                      local l_6_61 = ((l_6_9.FullFilePathScan)[l_6_45]).ExcludedFileInfo
                      local l_6_62 = {}
                      l_6_62.Size = l_6_58
                      l_6_62.LastModified = l_6_59
                      l_6_60(l_6_61, l_6_62)
                      l_6_60 = pcall
                      l_6_61 = CollectFile
                      l_6_62 = l_6_45
                      l_6_60 = l_6_60(l_6_61, l_6_62, l_6_58, true)
                      local l_6_63, l_6_64, l_6_65 = nil
                      -- DECOMPILER ERROR at PC404: Confused about usage of register: R35 in 'UnsetPending'

                      if l_6_60 then
                        if l_6_61 then
                          ((l_6_9.FullFilePathScan)[l_6_45]).Sha1 = l_6_62
                          -- DECOMPILER ERROR at PC407: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_6_9.FullFilePathScan)[l_6_45]).Sha256 = l_6_63
                          -- DECOMPILER ERROR at PC410: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_6_9.FullFilePathScan)[l_6_45]).PartialSha1 = l_6_64
                          -- DECOMPILER ERROR at PC413: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_6_9.FullFilePathScan)[l_6_45]).PartialSha256 = l_6_65
                          pcall(ReportResource, l_6_45, R38_PC421, (l_6_9.FullFilePathScan)[l_6_45], "LUA")
                        else
                          -- DECOMPILER ERROR at PC425: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_6_9.FullFilePathScan)[l_6_45]).Error_Facility = l_6_62
                          -- DECOMPILER ERROR at PC428: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_6_9.FullFilePathScan)[l_6_45]).Error_Code = l_6_63
                        end
                      end
                    end
                    do
                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC429: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
                end
              end
            end
          end
        end
      end
      l_6_27 = l_6_18.scanfile
      if l_6_27 then
        l_6_27 = l_6_18.scanfile
        l_6_28 = split
        l_6_28 = l_6_28(l_6_27, ",")
        for l_6_69,l_6_70 in ipairs(l_6_28) do
          local l_6_71 = (string.lower)((MpCommon.Base64Decode)(l_6_70))
          local l_6_72 = table.insert
          local l_6_73 = l_6_9.Processed
          local l_6_74 = {}
          l_6_74.scanfile = l_6_71
          l_6_72(l_6_73, l_6_74)
          l_6_72 = AppendToRollingQueueNamespaced
          l_6_73 = "hmdprecisionpulsescanfile"
          l_6_74 = l_6_2
          l_6_72(l_6_73, l_6_74, l_6_71, 1, l_6_6, 500, 1)
        end
      end
      do
        do
          l_6_27 = l_6_18.enumeratefolder
          if l_6_27 then
            l_6_27 = 260
            l_6_28 = ""
            local l_6_75 = "*"
            local l_6_76 = 0
            local l_6_77 = true
            local l_6_78 = false
            local l_6_79 = l_6_18.enumeratefolder
            local l_6_80 = split(l_6_79, ",")
            local l_6_81 = 0
            for l_6_85,l_6_86 in ipairs(l_6_80) do
              l_6_81 = l_6_81 + 1
              -- DECOMPILER ERROR at PC491: Confused about usage of register: R29 in 'UnsetPending'

              if l_6_27 < l_6_81 then
                ((l_6_9.FolderEnumeration)[l_6_28]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_6_87 = (string.lower)((MpCommon.Base64Decode)(l_6_86))
              local l_6_88 = explode(l_6_87, "|")
              if #l_6_88 == 4 then
                l_6_28 = l_6_88[1]
                l_6_75 = l_6_88[2]
                l_6_76 = tonumber(l_6_88[3]) or 0
                l_6_77 = tonumber(l_6_88[4]) == 1
              elseif #l_6_88 == 5 then
                l_6_28 = l_6_88[1]
                l_6_75 = l_6_88[2]
                l_6_76 = tonumber(l_6_88[3]) or 0
                l_6_77 = tonumber(l_6_88[4]) == 1
                l_6_78 = tonumber(l_6_88[5]) == 1
              else
                l_6_28 = l_6_88[1]
              end
              if l_6_28 ~= nil then
                local l_6_89 = #l_6_28 + 2
                -- DECOMPILER ERROR at PC556: Confused about usage of register: R32 in 'UnsetPending'

                ;
                (l_6_9.FolderEnumeration)[l_6_28] = {}
                -- DECOMPILER ERROR at PC560: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_6_9.FolderEnumeration)[l_6_28]).Files = {}
                -- DECOMPILER ERROR at PC564: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_6_9.FolderEnumeration)[l_6_28]).Subfolders = {}
                local l_6_90 = (sysio.FindFiles)(l_6_28, l_6_75, l_6_76)
                local l_6_91 = (sysio.FindFolders)(l_6_28, "*", 0)
                if l_6_90 ~= nil then
                  local l_6_92 = 0
                  for R38_PC421,l_6_97 in pairs(l_6_90) do
                    l_6_92 = l_6_92 + 1
                    -- DECOMPILER ERROR at PC589: Confused about usage of register: R40 in 'UnsetPending'

                    if l_6_27 < l_6_92 then
                      ((l_6_9.FolderEnumeration)[l_6_28]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC593: Confused about usage of register: R40 in 'UnsetPending'

                      ;
                      ((l_6_9.FolderEnumeration)[l_6_28]).TotalFilesEnumerated = #l_6_90
                      break
                    end
                    local l_6_98 = (string.sub)(l_6_97, l_6_89)
                    if l_6_78 then
                      local l_6_99 = (sysio.GetFileSize)(l_6_97)
                      local l_6_100 = (sysio.GetFileLastWriteTime)(l_6_97)
                      local l_6_101 = table.insert
                      local l_6_102 = ((l_6_9.FolderEnumeration)[l_6_28]).Files
                      local l_6_103 = {}
                      l_6_103.Name = l_6_98
                      l_6_103.Size = l_6_99
                      l_6_103.LastModified = l_6_100
                      l_6_101(l_6_102, l_6_103)
                      l_6_92 = l_6_92 + 1
                    end
                    if l_6_77 then
                      local l_6_104 = l_6_8
                      local l_6_105 = (MpCommon.AtomicCounterAddNamespaced)(l_6_3, l_6_2, 1)
                      -- DECOMPILER ERROR at PC634: Confused about usage of register: R43 in 'UnsetPending'

                      if l_6_104 <= l_6_105 then
                        ((l_6_9.FolderEnumeration)[l_6_28]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_6_2, (string.lower)(l_6_97), 1, l_6_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_6_97), 0, 5000)
                      end
                    end
                  end
                end
                l_6_92 = table
                l_6_92 = l_6_92.insert
                local l_6_106 = nil
                l_6_106 = l_6_9.Processed
                local l_6_107 = nil
                local l_6_108 = nil
                l_6_92(l_6_106, l_6_107)
                l_6_107 = {enumeratefolder = l_6_28}
                l_6_92 = sysio
                l_6_92 = l_6_92.IsFolderExists
                l_6_106 = l_6_28
                l_6_92 = l_6_92(l_6_106)
                if l_6_92 then
                  l_6_106 = l_6_9.FolderEnumeration
                  l_6_106 = l_6_106[l_6_28]
                  l_6_106.Exists = true
                  l_6_106 = l_6_9.FolderEnumeration
                  l_6_106 = l_6_106[l_6_28]
                  l_6_107 = sysio
                  l_6_107 = l_6_107.IsPathAVExcluded
                  l_6_108 = l_6_28
                  l_6_107 = l_6_107(l_6_108, true)
                  l_6_106.Excluded = l_6_107
                else
                  l_6_106 = l_6_9.FolderEnumeration
                  l_6_106 = l_6_106[l_6_28]
                  l_6_106.Exists = false
                end
                if l_6_78 == false then
                  l_6_106 = #l_6_90
                  if l_6_106 <= l_6_27 then
                    l_6_106 = table
                    l_6_106 = l_6_106.insert
                    l_6_107 = l_6_9.FolderEnumeration
                    l_6_107 = l_6_107[l_6_28]
                    local l_6_109 = nil
                    l_6_106(l_6_107, l_6_108)
                    l_6_108 = {Files = l_6_90}
                  else
                    l_6_107 = 1
                    l_6_108 = l_6_27
                    for i = l_6_107, l_6_108 do
                      local l_6_112 = nil
                      l_6_112 = l_6_90[l_6_111]
                    end
                    local l_6_113 = nil
                    local l_6_114 = nil
                    local l_6_115 = nil
                    ;
                    (table.insert)((l_6_9.FolderEnumeration)[l_6_28], l_6_113)
                    l_6_113 = {Files = l_6_106}
                    -- DECOMPILER ERROR at PC718: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_6_9.FolderEnumeration)[l_6_28]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC722: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_6_9.FolderEnumeration)[l_6_28]).TotalFilesEnumerated = #l_6_90
                  end
                end
                -- DECOMPILER ERROR at PC725: Overwrote pending register: R35 in 'AssignReg'

                if l_6_91 ~= nil then
                  for l_6_119,l_6_120 in pairs(l_6_91) do
                    local l_6_119, l_6_120 = nil
                    -- DECOMPILER ERROR at PC730: Overwrote pending register: R35 in 'AssignReg'

                    if l_6_27 < l_6_106 then
                      break
                    end
                    l_6_119 = string
                    l_6_119 = l_6_119.sub
                    l_6_120 = l_6_118
                    l_6_119 = l_6_119(l_6_120, l_6_89)
                    local l_6_121 = nil
                    l_6_120 = table
                    l_6_120 = l_6_120.insert
                    l_6_121 = l_6_9.FolderEnumeration
                    l_6_121 = l_6_121[l_6_28]
                    l_6_121 = l_6_121.Subfolders
                    l_6_120(l_6_121, l_6_119)
                  end
                end
                -- DECOMPILER ERROR at PC748: Overwrote pending register: R35 in 'AssignReg'

                l_6_106("hmdprecisionpulseenumeratefolder", l_6_2, l_6_28, 1, l_6_6, 500, 1)
                -- DECOMPILER ERROR at PC757: Confused about usage of register R37 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_6_27 = l_6_18.enumerateregistrykey
          if l_6_27 then
            l_6_27 = ""
            l_6_28 = l_6_18.enumerateregistrykey
            l_6_75 = split
            l_6_76 = l_6_28
            l_6_77 = ","
            l_6_75 = l_6_75(l_6_76, l_6_77)
            local l_6_122 = nil
            l_6_76 = ipairs
            l_6_77 = l_6_75
            l_6_76 = l_6_76(l_6_77)
            for l_6_79,l_6_80 in l_6_76 do
              local l_6_123, l_6_124, l_6_125, l_6_126, l_6_127 = nil
              l_6_81 = string
              l_6_81 = l_6_81.lower
              l_6_81 = l_6_81((MpCommon.Base64Decode)(l_6_80))
              local l_6_128 = nil
              l_6_27 = l_6_81
              if l_6_27 ~= nil then
                local l_6_129 = nil
                -- DECOMPILER ERROR at PC788: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC792: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC796: Confused about usage of register: R25 in 'UnsetPending'

                local l_6_130 = nil
                local l_6_131 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_6_27)) ~= nil then
                  (table.insert)(((l_6_9.RegkeyEnumeration)[l_6_27]).Keys, l_6_87)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_6_27)) ~= nil then
                    for l_6_88,l_6_89 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_6_27))) do
                      local l_6_132, l_6_133, l_6_134, l_6_135, l_6_136 = nil
                      l_6_90 = sysio
                      l_6_90 = l_6_90.GetRegValueType
                      l_6_91 = (sysio.RegOpenKey)(l_6_27)
                      l_6_92 = l_6_89
                      l_6_90 = (l_6_90(l_6_91, l_6_92))
                      local l_6_137 = nil
                      l_6_91 = nil
                      local l_6_138 = nil
                      if l_6_90 == 1 then
                        l_6_92 = sysio
                        l_6_92 = l_6_92.GetRegValueAsString
                        -- DECOMPILER ERROR at PC830: Overwrote pending register: R35 in 'AssignReg'

                        l_6_92 = l_6_92(l_6_106, l_6_89)
                        l_6_91 = l_6_92 or "Value not set"
                        l_6_92 = l_6_9.RegkeyEnumeration
                        l_6_92 = l_6_92[l_6_27]
                        l_6_92 = l_6_92.Values
                        l_6_92[l_6_89], l_6_106 = l_6_106, {}
                        l_6_92 = table
                        l_6_92 = l_6_92.insert
                        l_6_106 = l_6_9.RegkeyEnumeration
                        l_6_106 = l_6_106[l_6_27]
                        l_6_106 = l_6_106.Values
                        l_6_106 = l_6_106[l_6_89]
                        l_6_92(l_6_106, (l_6_91) .. l_6_122)
                      elseif l_6_90 == 2 then
                        l_6_92 = sysio
                        l_6_92 = l_6_92.GetRegValueAsString
                        l_6_106 = (sysio.RegOpenKey)(l_6_27)
                        l_6_92 = l_6_92(l_6_106, l_6_89)
                        l_6_91 = l_6_92 or "Value not set"
                        l_6_92 = l_6_9.RegkeyEnumeration
                        l_6_92 = l_6_92[l_6_27]
                        l_6_92 = l_6_92.Values
                        l_6_92[l_6_89], l_6_106 = l_6_106, {}
                        l_6_92 = table
                        l_6_92 = l_6_92.insert
                        l_6_106 = l_6_9.RegkeyEnumeration
                        l_6_106 = l_6_106[l_6_27]
                        l_6_106 = l_6_106.Values
                        l_6_106 = l_6_106[l_6_89]
                        -- DECOMPILER ERROR at PC874: Overwrote pending register: R37 in 'AssignReg'

                        l_6_92(l_6_106, (l_6_91) .. l_6_122)
                      elseif l_6_90 == 3 then
                        l_6_92 = sysio
                        l_6_92 = l_6_92.GetRegValueAsBinary
                        l_6_106 = (sysio.RegOpenKey)(l_6_27)
                        l_6_92 = l_6_92(l_6_106, l_6_89)
                        l_6_91 = l_6_92 or "Value not set"
                        l_6_92 = l_6_9.RegkeyEnumeration
                        l_6_92 = l_6_92[l_6_27]
                        l_6_92 = l_6_92.Values
                        l_6_92[l_6_89], l_6_106 = l_6_106, {}
                        l_6_92 = table
                        l_6_92 = l_6_92.insert
                        l_6_106 = l_6_9.RegkeyEnumeration
                        l_6_106 = l_6_106[l_6_27]
                        l_6_106 = l_6_106.Values
                        l_6_106 = l_6_106[l_6_89]
                        -- DECOMPILER ERROR at PC900: Overwrote pending register: R37 in 'AssignReg'

                        l_6_92(l_6_106, (l_6_91) .. l_6_122)
                      elseif l_6_90 == 4 then
                        l_6_92 = sysio
                        l_6_92 = l_6_92.GetRegValueAsDword
                        l_6_106 = (sysio.RegOpenKey)(l_6_27)
                        l_6_92 = l_6_92(l_6_106, l_6_89)
                        l_6_91 = l_6_92 or "Value not set"
                        l_6_92 = l_6_9.RegkeyEnumeration
                        l_6_92 = l_6_92[l_6_27]
                        l_6_92 = l_6_92.Values
                        l_6_92[l_6_89], l_6_106 = l_6_106, {}
                        l_6_92 = table
                        l_6_92 = l_6_92.insert
                        l_6_106 = l_6_9.RegkeyEnumeration
                        l_6_106 = l_6_106[l_6_27]
                        l_6_106 = l_6_106.Values
                        l_6_106 = l_6_106[l_6_89]
                        -- DECOMPILER ERROR at PC926: Overwrote pending register: R37 in 'AssignReg'

                        l_6_92(l_6_106, (l_6_91) .. l_6_122)
                      elseif l_6_90 == 7 then
                        l_6_92 = sysio
                        l_6_92 = l_6_92.GetRegValueAsMultiString
                        l_6_106 = (sysio.RegOpenKey)(l_6_27)
                        l_6_92 = l_6_92(l_6_106, l_6_89)
                        l_6_91 = l_6_92 or "Value not set"
                        l_6_92 = l_6_9.RegkeyEnumeration
                        l_6_92 = l_6_92[l_6_27]
                        l_6_92 = l_6_92.Values
                        l_6_92[l_6_89], l_6_106 = l_6_106, {}
                        l_6_92 = ipairs
                        l_6_106 = l_6_91
                        l_6_92 = l_6_92(l_6_106)
                        for l_6_122,l_6_123 in l_6_92 do
                          local l_6_139, l_6_140, l_6_141, l_6_142, l_6_143 = nil
                          l_6_124 = table
                          l_6_124 = l_6_124.insert
                          l_6_125 = l_6_9.RegkeyEnumeration
                          l_6_125 = l_6_125[l_6_27]
                          l_6_125 = l_6_125.Values
                          l_6_125 = l_6_125[l_6_89]
                          l_6_126 = l_6_123
                          l_6_127 = " (REG_MULTI_SZ)"
                          l_6_126 = l_6_126 .. l_6_127
                          l_6_124(l_6_125, l_6_126)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_6_27), l_6_89) then
                          l_6_91 = l_6_90 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC976: Confused about usage of register: R34 in 'UnsetPending'

                        ;
                        (((l_6_9.RegkeyEnumeration)[l_6_27]).Values)[l_6_89] = {}
                        -- DECOMPILER ERROR at PC984: Overwrote pending register: R37 in 'AssignReg'

                        ;
                        (table.insert)((((l_6_9.RegkeyEnumeration)[l_6_27]).Values)[l_6_89], (l_6_91) .. l_6_122)
                      end
                      l_6_91 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_6_27), l_6_89) or "Value not set"
                      -- DECOMPILER ERROR at PC1000: Confused about usage of register: R34 in 'UnsetPending'

                      ;
                      (((l_6_9.RegkeyEnumeration)[l_6_27]).Values)[l_6_89] = {}
                      ;
                      (table.insert)((((l_6_9.RegkeyEnumeration)[l_6_27]).Values)[l_6_89], (l_6_91) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_6_144 = nil
                local l_6_145 = nil
                local l_6_146 = nil
                ;
                (table.insert)(l_6_9.Processed, {enumerateregistrykey = l_6_27})
              end
            end
            -- DECOMPILER ERROR at PC1021: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          end
          l_6_27 = l_6_18.deleteregistryvalue
          if l_6_27 then
            l_6_27 = ""
            l_6_28 = l_6_18.deleteregistryvalue
            l_6_75 = split
            l_6_75 = l_6_75(l_6_28, ",")
            local l_6_147 = nil
            for l_6_151,l_6_152 in ipairs(l_6_75) do
              local l_6_148, l_6_149, l_6_150, l_6_151, l_6_152 = nil
              l_6_81 = string
              l_6_81 = l_6_81.lower
              -- DECOMPILER ERROR at PC1038: Confused about usage of register: R22 in 'UnsetPending'

              l_6_81 = l_6_81((MpCommon.Base64Decode)(l_6_80))
              local l_6_153 = nil
              if l_6_27 ~= nil then
                l_6_27 = explode(l_6_81, "|")
                if #l_6_27 == 2 then
                  local l_6_154 = nil
                  local l_6_155 = nil
                  -- DECOMPILER ERROR at PC1055: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1058: Confused about usage of register: R24 in 'UnsetPending'

                  local l_6_156 = nil
                  if (sysio.RegOpenKey)(l_6_27[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1069: Confused about usage of register: R24 in 'UnsetPending'

                    local l_6_157 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_6_2, (string.format)("%s\\\\%s", l_6_27[1], l_6_27[2]), l_6_90, l_6_91, 500, 1)
                    -- DECOMPILER ERROR at PC1086: Overwrote pending register: R32 in 'AssignReg'

                    local l_6_158, l_6_159 = nil
                    -- DECOMPILER ERROR at PC1091: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1091: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_6_90)
                    -- DECOMPILER ERROR at PC1095: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1096: Overwrote pending register: R33 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_6_90, l_6_91, 1, l_6_6, 500, 1)
                    -- DECOMPILER ERROR at PC1105: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1106: Overwrote pending register: R33 in 'AssignReg'

                    local l_6_160, l_6_161 = nil
                    -- DECOMPILER ERROR at PC1109: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1110: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1111: Overwrote pending register: R33 in 'AssignReg'

                    l_6_90(l_6_91, (string.format)("%s\\\\%s", l_6_27[1], l_6_27[2]))
                  else
                    -- DECOMPILER ERROR at PC1116: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1116: Confused about usage of register: R27 in 'UnsetPending'

                  end
                  local l_6_162 = nil
                  -- DECOMPILER ERROR at PC1119: Overwrote pending register: R28 in 'AssignReg'

                  local l_6_163 = nil
                  local l_6_164 = nil
                  -- DECOMPILER ERROR at PC1121: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1121: Overwrote pending register: R30 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1123: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1123: Overwrote pending register: R32 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_6_2, l_6_90), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_6_90, l_6_91, (string.format)("%s\\\\%s", l_6_27[1], l_6_27[2])) .. " " .. l_6_90})
                end
              end
            end
          end
          l_6_27 = l_6_18.process
          if l_6_27 then
            l_6_27 = mp
            l_6_27 = l_6_27.get_contextdata
            l_6_28 = mp
            l_6_28 = l_6_28.CONTEXT_DATA_PROCESS_PPID
            l_6_27 = l_6_27(l_6_28)
            if l_6_27 == nil then
              l_6_28 = MpCommon
              l_6_28 = l_6_28.ExpandEnvironmentVariables
              l_6_75 = "%windir%"
              l_6_28 = l_6_28(l_6_75)
              l_6_75 = l_6_28
              l_6_75 = l_6_75 .. "\\system32\\"
              local l_6_165 = nil
              local l_6_166 = nil
              if #(sysio.GetProcessFromFileName)(l_6_75 .. "services.exe") > 0 then
                l_6_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_6_75 .. "services.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_6_75 .. "services.exe"))[1]).starttime)
              end
            end
            l_6_28 = table
            l_6_28 = l_6_28.insert
            l_6_75 = l_6_9.Processed
            local l_6_167 = nil
            local l_6_168 = nil
            l_6_28(l_6_75, {process = l_6_18.process})
            l_6_28 = MpCommon
            l_6_28 = l_6_28.BmTriggerSig
            l_6_75 = l_6_27
            l_6_28(l_6_75, "Heimdall_ProcessDispatch", l_6_18.process)
          end
          l_6_27 = l_6_18.firewall
          if l_6_27 then
            l_6_27 = l_6_18.firewall
            l_6_28 = split
            l_6_75 = l_6_27
            l_6_28 = l_6_28(l_6_75, ",")
            l_6_75 = ipairs
            l_6_75 = l_6_75(l_6_28)
            for l_6_172,l_6_173 in l_6_75 do
              local l_6_169, l_6_170, l_6_171, l_6_172, l_6_173 = nil
              -- DECOMPILER ERROR at PC1191: Confused about usage of register: R21 in 'UnsetPending'

              local l_6_174 = nil
              -- DECOMPILER ERROR at PC1195: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1196: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_81) then
                local l_6_175 = nil
                local l_6_176 = nil
                local l_6_177 = nil
                l_6_81(l_6_9.Processed, {firewall = (MpCommon.Base64Decode)(l_6_81)})
                -- DECOMPILER ERROR at PC1201: Overwrote pending register: R23 in 'AssignReg'

                l_6_81 = l_6_81((MpCommon.Base64Decode)(l_6_81), "_")
                l_6_81 = #l_6_81
                if l_6_81 == 3 then
                  l_6_81 = tonumber
                  -- DECOMPILER ERROR at PC1210: Confused about usage of register: R22 in 'UnsetPending'

                  l_6_81 = l_6_81(l_6_81[2])
                  -- DECOMPILER ERROR at PC1214: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1216: Confused about usage of register: R22 in 'UnsetPending'

                  local l_6_178 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_6_81[1], tonumber(l_6_81[3]), (mp.bitand)(l_6_81, 2) == 2, (mp.bitand)(l_6_81, 1) == 1)
                end
              end
            end
          end
          l_6_27 = l_6_18.sinkholedns
          if l_6_27 then
            l_6_27 = l_6_18.sinkholedns
            l_6_28 = split
            l_6_28 = l_6_28(l_6_27, ",")
            for l_6_187,l_6_188 in ipairs(l_6_28) do
              local l_6_184, l_6_185, l_6_186, l_6_187, l_6_188 = nil
              -- DECOMPILER ERROR at PC1253: Confused about usage of register: R21 in 'UnsetPending'

              local l_6_189 = nil
              -- DECOMPILER ERROR at PC1255: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1256: Overwrote pending register: R23 in 'AssignReg'

              local l_6_190 = nil
              local l_6_191 = nil
              local l_6_192 = nil
              l_6_81(l_6_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_6_81)})
              -- DECOMPILER ERROR at PC1263: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_81) then
                l_6_81 = l_6_81((MpCommon.Base64Decode)(l_6_81), "_")
                -- DECOMPILER ERROR at PC1269: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC1272: Confused about usage of register: R22 in 'UnsetPending'

                l_6_81 = l_6_81(l_6_81[1], tonumber(l_6_81[2]))
                -- DECOMPILER ERROR at PC1277: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1279: Confused about usage of register: R22 in 'UnsetPending'

                local l_6_193 = nil
                l_6_9["sinkholedns" .. "_" .. l_6_81[1] .. "_" .. l_6_81[2]] = {res = l_6_81, isAllowed = l_6_81[1]}
              end
            end
          end
          l_6_27 = l_6_18.dnscache
          if l_6_27 then
            l_6_27 = l_6_18.dnscache
            l_6_28 = split
            l_6_28 = l_6_28(l_6_27, ",")
            for l_6_197,l_6_198 in ipairs(l_6_28) do
              local l_6_194, l_6_195, l_6_196, l_6_197, l_6_198 = nil
              -- DECOMPILER ERROR at PC1301: Confused about usage of register: R21 in 'UnsetPending'

              local l_6_199 = nil
              -- DECOMPILER ERROR at PC1303: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1304: Overwrote pending register: R23 in 'AssignReg'

              local l_6_200 = nil
              local l_6_201 = nil
              local l_6_202 = nil
              l_6_81(l_6_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_6_81)})
              -- DECOMPILER ERROR at PC1311: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_81) then
                l_6_81 = l_6_81((MpCommon.Base64Decode)(l_6_81), "_")
                for i_1,i_2 in ipairs(l_6_81) do
                  local l_6_203, l_6_204, l_6_205 = nil
                  l_6_9["dnscache" .. "_" .. i_2], l_6_81 = l_6_81, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_6_27 = l_6_18.debug
          if l_6_27 then
            l_6_27 = l_6_18.debug
            l_6_28 = split
            l_6_28 = l_6_28(l_6_27, ",")
            local l_6_206 = nil
            for l_6_210,l_6_211 in ipairs(l_6_28) do
              local l_6_207, l_6_208, l_6_209, l_6_210, l_6_211 = nil
              l_6_81 = MpCommon
              l_6_81 = l_6_81.Base64Decode
              -- DECOMPILER ERROR at PC1350: Confused about usage of register: R22 in 'UnsetPending'

              l_6_81 = l_6_81(l_6_81)
              local l_6_212 = nil
              local l_6_213 = nil
              local l_6_214 = nil
              local l_6_215 = nil
              ;
              (table.insert)(l_6_9.Processed, {debug = l_6_81})
              for l_6_219,l_6_220 in ipairs((split(l_6_81, "_"))) do
                local l_6_216, l_6_217, l_6_218, l_6_219, l_6_220 = nil
                -- DECOMPILER ERROR at PC1367: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1368: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1368: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1372: Overwrote pending register: R25 in 'AssignReg'

                -- DECOMPILER ERROR at PC1373: Confused about usage of register: R31 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1373: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1376: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1376: Overwrote pending register: R32 in 'AssignReg'

                -- DECOMPILER ERROR at PC1377: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1379: Overwrote pending register: R32 in 'AssignReg'

                if nil == "PC" then
                  local l_6_221 = nil
                  -- DECOMPILER ERROR at PC1380: Overwrote pending register: R33 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1384: Confused about usage of register: R26 in 'UnsetPending'

                  l_6_91 = l_6_91(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1389: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1391: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1391: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PCNP" then
                    l_6_91 = ":"
                    -- DECOMPILER ERROR at PC1393: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1394: Overwrote pending register: R32 in 'AssignReg'

                    local l_6_222 = nil
                    l_6_91 = table_pack
                    -- DECOMPILER ERROR at PC1399: Confused about usage of register: R26 in 'UnsetPending'

                    l_6_91 = l_6_91(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1404: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1406: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1406: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "RQ" then
                      l_6_91 = ":"
                      -- DECOMPILER ERROR at PC1408: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1409: Overwrote pending register: R32 in 'AssignReg'

                      local l_6_223 = nil
                      l_6_91 = table_pack
                      -- DECOMPILER ERROR at PC1414: Confused about usage of register: R26 in 'UnsetPending'

                      l_6_91 = l_6_91(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1419: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1421: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1421: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "AC" then
                        l_6_91 = ":"
                        -- DECOMPILER ERROR at PC1423: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1424: Overwrote pending register: R32 in 'AssignReg'

                        local l_6_224 = nil
                        l_6_91 = table_pack
                        -- DECOMPILER ERROR at PC1429: Confused about usage of register: R26 in 'UnsetPending'

                        l_6_91 = l_6_91(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_6_9.debug = {[l_6_90] = l_6_91, [l_6_90] = l_6_91, [l_6_90] = l_6_91, [l_6_90] = l_6_91}
          end
          l_6_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_6_10.report = safeJsonSerialize(l_6_9, 260)
          l_6_10.TAG = "NOLOOKUP"
          SafeGetUrlReputation(l_6_28, l_6_10, false, 2000)
          -- DECOMPILER ERROR at PC1453: Confused about usage of register R37 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


