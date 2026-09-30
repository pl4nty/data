-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\PrecisionPulseHelpers\1.luac 

-- params : ...
-- function num : 0
ReportSupportLog = function(l_1_0)
  -- function num : 0_0
  do
    local l_1_1, l_1_2 = (MpCommon.ExpandEnvironmentVariables)("%ProgramData%") or "C:\\ProgramData"
    -- DECOMPILER ERROR at PC7: Confused about usage of register: R1 in 'UnsetPending'

    local l_1_3 = nil
    local l_1_4 = l_1_1 .. "\\Microsoft\\Windows Defender\\Support"
    local l_1_5 = "hmdprecisionpulse"
    local l_1_6 = 86400
    for l_1_10,l_1_11 in pairs((sysio.FindFiles)(l_1_4, "*", 1)) do
      local l_1_7 = nil
      -- DECOMPILER ERROR at PC24: Confused about usage of register: R10 in 'UnsetPending'

      if (string.find)(R10_PC24, "MpWppTracing", 1, true) or (string.find)(R10_PC24, "MPScanSkip", 1, true) or (string.find)(R10_PC24, "MPLog", 1, true) then
        local l_1_13 = 0
        local l_1_14, l_1_15 = , pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulsereportresource", l_1_5, l_1_12)
        if l_1_15 and MpCommon.RollingQueueQueryKeyNamespaced then
          l_1_13 = tonumber(R16_PC64)
        end
        local l_1_16 = nil
        -- DECOMPILER ERROR at PC70: Overwrote pending register: R16 in 'AssignReg'

        local l_1_17 = (MpCommon.GetCurrentTimeT)()
        local l_1_18 = R16_PC64
        local l_1_19 = (sysio.GetFileLastWriteTime)(l_1_12)
        local l_1_20 = {ReadTimeStamp = l_1_17, tracking_id = l_1_0, Size = l_1_18, LastModified = l_1_19}
        local l_1_21 = (sysio.ReadFile)(l_1_12, l_1_13, l_1_18)
        if ((sysio.GetLastResult)()).Success then
          l_1_21 = (MpCommon.Base64Encode)(l_1_21)
          ReportResource(l_1_12, l_1_21, l_1_20, "LUA")
        else
          l_1_20.Facility = ((sysio.GetLastResult)()).Facility
          l_1_20.Code = ((sysio.GetLastResult)()).Code
          ReportResource(l_1_12, "NULL", l_1_20, "LUA")
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
      local l_2_3, l_2_4 = 2086912 * 18
    end
    local l_2_5 = nil
    local l_2_6 = nil
    -- DECOMPILER ERROR at PC33: Overwrote pending register: R4 in 'AssignReg'

    if l_2_5 < l_2_1 then
      local l_2_7 = (MpCommon.GetCurrentTimeT)()
      local l_2_8 = {}
      if not ((sysio.GetLastResult)()).Success then
        local l_2_9 = nil
        local l_2_10 = nil
        return l_2_10, {Error_Facility = l_2_9.Facility, Error_Code = l_2_9.Code}
      end
      do
        local l_2_11, l_2_12, l_2_13, l_2_14 = , nil, nil, nil
        -- DECOMPILER ERROR at PC64: Overwrote pending register: R11 in 'AssignReg'

        -- DECOMPILER ERROR at PC86: Overwrote pending register: R4 in 'AssignReg'

        do
          if l_2_5 >= l_2_1 or l_2_6 then
            local l_2_15 = nil
            return l_2_6, {Sha1 = l_2_12, Sha256 = l_2_13, PartialSha1 = l_2_14, PartialSha256 = l_2_15, ReadTimeStamp = l_2_7}
          end
          return nil, {}
        end
      end
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
    if (SafeGetUrlReputation(l_3_12, l_3_0, false, 2000 + l_3_2 * 500, false, false)).error == 3 then
      return SafeGetUrlReputation(l_3_12, l_3_0, false, 2000 + l_3_2 * 500, false, false)
    end
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
  local l_4_4 = "hmdprecisionpulse"
  local l_4_5 = 86400
  do
    if not l_4_2.Sha256 then
      local l_4_6, l_4_7 = l_4_2.PartialSha256
    end
    local l_4_8 = nil
    -- DECOMPILER ERROR at PC21: Overwrote pending register: R7 in 'AssignReg'

    if l_4_8 and pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulsereportresource", l_4_4, nil) and MpCommon.RollingQueueQueryKeyNamespaced then
      return 
    end
    local l_4_9 = nil
    local l_4_10 = 64500
    local l_4_11 = 576
    local l_4_12 = #l_4_1
    local l_4_13 = 1
    local l_4_14 = 0
    while 1 do
      -- DECOMPILER ERROR at PC45: Confused about usage of register: R15 in 'UnsetPending'

      if #l_4_1 > 0 then
        do
          local l_4_16 = nil
          -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_THEN_STMT

          -- DECOMPILER ERROR at PC46: LeaveBlock: unexpected jumping out IF_STMT

        end
      end
    end
    do
      if l_4_11 < 0 + 1 then
        local l_4_15 = nil
      end
      local l_4_17 = nil
      local l_4_18 = nil
      local l_4_19 = #l_4_1 - l_4_10
      local l_4_20 = l_4_11 - 1
      while 1 do
        if l_4_13 <= l_4_17 and l_4_14 < l_4_11 then
          local l_4_21 = {}
          local l_4_22 = 0
          local l_4_23, l_4_24 = , {SIG_CONTEXT = "Lua_Custom_Upload_Resource", CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE", TAG = "NOLOOKUP", ResourceName = l_4_0, ResourceInfo = safeJsonSerialize(l_4_2), ResourceSize = l_4_17, LastIndex = l_4_20, Source = l_4_3, Index = l_4_14}
          local l_4_27, l_4_28 = nil
          if pcall(l_0_0, l_4_24, l_4_1:sub(l_4_13, l_4_13 + l_4_10 - 1), l_4_14) and l_0_0 and not l_0_0.error then
            l_4_22 = l_4_22 + 1
          else
            local l_4_29 = nil
            -- DECOMPILER ERROR at PC110: Overwrote pending register: R26 in 'AssignReg'

            -- DECOMPILER ERROR at PC112: Overwrote pending register: R26 in 'AssignReg'

            if l_4_29 then
              do
                do
                  AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource_failedIndexes", l_4_4, l_4_9, nil, l_4_5, 500, 1)
                  l_4_14 = l_4_14 + 1
                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC123: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      -- DECOMPILER ERROR at PC124: Confused about usage of register: R18 in 'UnsetPending'

      if l_4_22 == l_4_18 then
        if l_4_8 then
          local l_4_30 = nil
          AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource", l_4_4, l_4_0 .. "|" .. l_4_8, 1, l_4_5, 500, 1)
        else
          do
            do
              if l_4_17 < l_4_11 * l_4_10 then
                local l_4_31 = nil
              end
              local l_4_32 = nil
              AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource", l_4_4, l_4_0, not (string.find)(l_4_0, "MpWppTracing", 1, true) and not (string.find)(l_4_0, "MPScanSkip", 1, true) and not (string.find)(l_4_0, "MPLog", 1, true) or l_4_17, l_4_5, 500, 1)
            end
          end
        end
      end
    end
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
          -- DECOMPILER ERROR at PC100: Overwrote pending register: R13 in 'AssignReg'

          local l_5_10, l_5_11, l_5_12 = pcall(CollectFile, l_5_6, ".zip", true)
          -- DECOMPILER ERROR at PC113: Overwrote pending register: R15 in 'AssignReg'

          -- DECOMPILER ERROR at PC114: Overwrote pending register: R16 in 'AssignReg'

          -- DECOMPILER ERROR at PC115: Overwrote pending register: R17 in 'AssignReg'

          if l_5_10 and l_5_12 then
            if l_5_11 then
              ReportResource(l_5_6, ".saz", ".cpp", ".cs")
              ;
              (bm.add_related_string)("FileReported_" .. l_5_6, safeJsonSerialize(l_5_12), bm.RelatedStringBMReport)
            else
              ;
              (bm.add_related_string)("FileReadFailed_" .. l_5_6, safeJsonSerialize(l_5_12), bm.RelatedStringBMReport)
            end
          end
        end
      end
    end
  end
  do
    do
      local l_5_13, l_5_14 = nil
      -- DECOMPILER ERROR at PC150: Overwrote pending register: R3 in 'AssignReg'

      if not l_5_1 and l_5_13 then
        l_5_14("bmInfoFailReason", tostring(l_5_13), bm.RelatedStringBMReport)
      end
      -- DECOMPILER ERROR at PC158: Overwrote pending register: R3 in 'AssignReg'

      l_5_14()
      -- DECOMPILER ERROR at PC160: Overwrote pending register: R3 in 'AssignReg'

      l_5_14()
      -- DECOMPILER ERROR at PC162: Overwrote pending register: R3 in 'AssignReg'

      l_5_14()
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
  local l_6_12 = split(l_6_0, "++")
  for l_6_16,l_6_17 in ipairs(l_6_12) do
    local l_6_18, l_6_19 = l_6_17:match("(.+)::(.+)")
    if l_6_18 and l_6_19 then
      l_6_11[l_6_18] = l_6_19
    end
  end
  local l_6_20 = {}
  local l_6_21 = l_6_11
  for l_6_25,l_6_26 in pairs(l_6_21) do
    local l_6_27 = l_6_25
    l_6_20[l_6_27] = l_6_26
  end
  if l_6_20.tracking_id then
    l_6_7 = l_6_20.tracking_id
  end
  if l_6_7 == nil then
    l_6_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_6_28 = table.insert
  local l_6_29 = l_6_9.Processed
  local l_6_30 = {}
  l_6_30.TrackingId = l_6_7
  l_6_28(l_6_29, l_6_30)
  l_6_28 = l_6_20.ttl
  if l_6_28 then
    l_6_6 = l_6_20.ttl
    l_6_28 = table
    l_6_28 = l_6_28.insert
    l_6_29 = l_6_9.Processed
    l_6_28(l_6_29, l_6_30)
    l_6_30 = {Ttl = l_6_6}
  end
  l_6_28 = l_6_20.suppress_ttl
  if l_6_28 then
    l_6_5 = l_6_20.suppress_ttl
    l_6_28 = table
    l_6_28 = l_6_28.insert
    l_6_29 = l_6_9.Processed
    l_6_28(l_6_29, l_6_30)
    l_6_30 = {suppress_ttl = l_6_5}
  end
  l_6_28 = MpCommon
  l_6_28 = l_6_28.AtomicCounterValueNamespaced
  l_6_29 = l_6_3
  l_6_30 = l_6_2
  l_6_28 = l_6_28(l_6_29, l_6_30)
  if l_6_28 == nil then
    l_6_29 = MpCommon
    l_6_29 = l_6_29.AtomicCounterSetNamespaced
    l_6_30 = l_6_3
    l_6_29(l_6_30, l_6_2, 0, l_6_5)
  end
  l_6_29 = l_6_20.maxscan
  if l_6_29 then
    l_6_29 = tonumber
    l_6_30 = l_6_20.maxscan
    l_6_29 = l_6_29(l_6_30)
    l_6_8 = l_6_29 or 500
    l_6_29 = MpCommon
    l_6_29 = l_6_29.AtomicCounterValueNamespaced
    l_6_30 = l_6_4
    l_6_29 = l_6_29(l_6_30, l_6_2)
    if l_6_29 == nil then
      l_6_30 = MpCommon
      l_6_30 = l_6_30.AtomicCounterSetNamespaced
      l_6_30(l_6_4, l_6_2, l_6_8, l_6_6)
    else
      l_6_30 = MpCommon
      l_6_30 = l_6_30.AtomicCounterSubNamespaced
      l_6_30(l_6_4, l_6_2, l_6_29)
      l_6_30 = MpCommon
      l_6_30 = l_6_30.AtomicCounterAddNamespaced
      l_6_30(l_6_4, l_6_2, l_6_8)
    end
    l_6_30 = table
    l_6_30 = l_6_30.insert
    local l_6_31 = l_6_9.Processed
    local l_6_32 = {}
    l_6_32.max_scan = l_6_8
    l_6_30(l_6_31, l_6_32)
  end
  do
    l_6_29 = l_6_20.scanpath
    if l_6_29 then
      l_6_29 = l_6_20.scanpath
      l_6_30 = split
      l_6_30 = l_6_30(l_6_29, ",")
      for l_6_36,l_6_37 in ipairs(l_6_30) do
        local l_6_38 = (string.lower)((MpCommon.Base64Decode)(l_6_37))
        local l_6_39 = table.insert
        local l_6_40 = l_6_9.Processed
        local l_6_41 = {}
        l_6_41.scanpath = l_6_38
        l_6_39(l_6_40, l_6_41)
        l_6_39 = AppendToRollingQueueNamespaced
        l_6_40 = "hmdprecisionpulsefolderscan"
        l_6_41 = l_6_2
        l_6_39(l_6_40, l_6_41, l_6_38, 1, l_6_6, 500, 1)
        l_6_39 = mp
        l_6_39 = l_6_39.TriggerScanResource
        l_6_40 = "folder"
        l_6_41 = l_6_38
        l_6_39(l_6_40, l_6_41, 0, 5000)
        l_6_39 = l_6_9.ScanPath
        l_6_39[l_6_38], l_6_40 = l_6_40, {}
        l_6_39 = table
        l_6_39 = l_6_39.insert
        l_6_40 = l_6_9.Processed
        l_6_39(l_6_40, l_6_41)
        l_6_41 = {scanpath = l_6_38}
        l_6_39 = sysio
        l_6_39 = l_6_39.IsFolderExists
        l_6_40 = l_6_38
        l_6_39 = l_6_39(l_6_40)
        if l_6_39 then
          l_6_40 = l_6_9.ScanPath
          l_6_40 = l_6_40[l_6_38]
          l_6_40.Exists = true
          l_6_40 = l_6_9.ScanPath
          l_6_40 = l_6_40[l_6_38]
          l_6_41 = sysio
          l_6_41 = l_6_41.IsPathAVExcluded
          l_6_41 = l_6_41(l_6_38, true)
          l_6_40.Excluded = l_6_41
        else
          l_6_40 = l_6_9.ScanPath
          l_6_40 = l_6_40[l_6_38]
          l_6_40.Exists = false
        end
      end
    end
    do
      l_6_29 = l_6_20.fullfilepathscan
      if l_6_29 then
        l_6_29 = l_6_20.fullfilepathscan
        l_6_30 = split
        l_6_30 = l_6_30(l_6_29, ",")
        for l_6_45,l_6_46 in ipairs(l_6_30) do
          local l_6_47 = (string.lower)((MpCommon.Base64Decode)(l_6_46))
          if (string.find)(l_6_47, "\\windows defender\\support", 1, true) then
            pcall(ReportSupportLog, l_6_7)
          end
          local l_6_48 = (sysio.IsFileExists)(l_6_47)
          local l_6_49 = table.insert
          local l_6_50 = l_6_9.Processed
          local l_6_51 = {}
          l_6_51.fullfilepathscan = l_6_47
          l_6_49(l_6_50, l_6_51)
          l_6_49 = l_6_9.FullFilePathScan
          l_6_49[l_6_47], l_6_50 = l_6_50, {}
          l_6_49 = true
          if l_6_48 then
            l_6_50 = string
            l_6_50 = l_6_50.match
            l_6_51 = l_6_47
            l_6_50 = l_6_50(l_6_51, "(.-)[\\/][^\\/]*$")
            l_6_51 = l_6_9.FullFilePathScan
            l_6_51 = l_6_51[l_6_47]
            l_6_51.Exists = true
            l_6_51 = pcall
            l_6_51 = l_6_51(IsAVExcluded, l_6_50)
            do
              if IsAVExcluded == nil then
                local l_6_52, l_6_53, l_6_54 = false
              end
              -- DECOMPILER ERROR at PC283: Confused about usage of register: R29 in 'UnsetPending'

              ;
              ((l_6_9.FullFilePathScan)[l_6_47]).Excluded = (sysio.IsPathAVExcluded)(l_6_50, true)
              -- DECOMPILER ERROR at PC286: Confused about usage of register: R28 in 'UnsetPending'

              -- DECOMPILER ERROR at PC286: Confused about usage of register: R29 in 'UnsetPending'

              ;
              ((l_6_9.FullFilePathScan)[l_6_47]).Excluded_LUA_API = l_6_52
              -- DECOMPILER ERROR at PC292: Confused about usage of register: R28 in 'UnsetPending'

              if ((l_6_9.FullFilePathScan)[l_6_47]).Excluded == true and l_6_52 == true then
                l_6_49 = false
              end
              l_6_49 = false
              l_6_50 = l_6_9.FullFilePathScan
              l_6_50 = l_6_50[l_6_47]
              l_6_50.Exists = false
              l_6_50 = pcallEx
              l_6_51 = "AppendToRollingQueueNamespaced"
              l_6_50 = l_6_50(l_6_51, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_6_2, l_6_47, 1, l_6_6, 500, 1)
              do
                if not l_6_50 then
                  local l_6_55 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC329: Confused about usage of register: R29 in 'UnsetPending'

                  if l_6_55 and type(l_6_55) == "table" then
                    ((l_6_9.FullFilePathScan)[l_6_47]).RQErrors = safeJsonSerialize(l_6_55, 260)
                  end
                end
                if l_6_49 then
                  (mp.TriggerScanResource)("file", l_6_47, 0, 10000)
                  local l_6_56 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_6_56 then
                    local l_6_57 = l_6_56 .. "\\system32\\"
                    local l_6_58 = (sysio.GetProcessFromFileName)(l_6_57 .. "services.exe")
                    if #l_6_58 > 0 then
                      local l_6_59 = (string.format)("pid:%d,ProcessStart:%u", (l_6_58[1]).pid, (l_6_58[1]).starttime)
                      if l_6_59 then
                        (MpCommon.BmTriggerSig)(l_6_59, "hmdprecisionpulsefullfilepathscan_statuscheck", l_6_47)
                      end
                    end
                  end
                end
                do
                  -- DECOMPILER ERROR at PC373: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC373: LeaveBlock: unexpected jumping out DO_STMT

                  -- DECOMPILER ERROR at PC373: LeaveBlock: unexpected jumping out IF_THEN_STMT

                  -- DECOMPILER ERROR at PC373: LeaveBlock: unexpected jumping out IF_STMT

                end
              end
            end
          end
        end
      end
      l_6_29 = l_6_20.scanfile
      if l_6_29 then
        l_6_29 = l_6_20.scanfile
        l_6_30 = split
        l_6_30 = l_6_30(l_6_29, ",")
        for l_6_63,l_6_64 in ipairs(l_6_30) do
          local l_6_65 = (string.lower)((MpCommon.Base64Decode)(l_6_64))
          local l_6_66 = table.insert
          local l_6_67 = l_6_9.Processed
          local l_6_68 = {}
          l_6_68.scanfile = l_6_65
          l_6_66(l_6_67, l_6_68)
          l_6_66 = AppendToRollingQueueNamespaced
          l_6_67 = "hmdprecisionpulsescanfile"
          l_6_68 = l_6_2
          l_6_66(l_6_67, l_6_68, l_6_65, 1, l_6_6, 500, 1)
        end
      end
      do
        do
          l_6_29 = l_6_20.enumeratefolder
          if l_6_29 then
            l_6_29 = 260
            l_6_30 = ""
            local l_6_69 = "*"
            local l_6_70 = 0
            local l_6_71 = true
            local l_6_72 = true
            local l_6_73 = l_6_20.enumeratefolder
            local l_6_74 = split(l_6_73, ",")
            local l_6_75 = 0
            for l_6_79,l_6_80 in ipairs(l_6_74) do
              l_6_75 = l_6_75 + 1
              -- DECOMPILER ERROR at PC435: Confused about usage of register: R30 in 'UnsetPending'

              if l_6_29 < l_6_75 then
                ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_6_81 = (string.lower)((MpCommon.Base64Decode)(l_6_80))
              local l_6_82 = explode(l_6_81, "|")
              if #l_6_82 == 4 then
                l_6_30 = l_6_82[1]
                l_6_69 = l_6_82[2]
                l_6_70 = tonumber(l_6_82[3]) or 0
                l_6_71 = tonumber(l_6_82[4]) == 1
              elseif #l_6_82 == 5 then
                l_6_30 = l_6_82[1]
                l_6_69 = l_6_82[2]
                l_6_70 = tonumber(l_6_82[3]) or 0
                l_6_71 = tonumber(l_6_82[4]) == 1
                l_6_72 = tonumber(l_6_82[5]) == 1
              else
                l_6_30 = l_6_82[1]
              end
              if l_6_30 ~= nil then
                local l_6_83 = #l_6_30 + 2
                -- DECOMPILER ERROR at PC500: Confused about usage of register: R33 in 'UnsetPending'

                ;
                (l_6_9.FolderEnumeration)[l_6_30] = {}
                -- DECOMPILER ERROR at PC504: Confused about usage of register: R33 in 'UnsetPending'

                ;
                ((l_6_9.FolderEnumeration)[l_6_30]).Files = {}
                -- DECOMPILER ERROR at PC508: Confused about usage of register: R33 in 'UnsetPending'

                ;
                ((l_6_9.FolderEnumeration)[l_6_30]).Subfolders = {}
                local l_6_84 = (sysio.FindFiles)(l_6_30, l_6_69, l_6_70)
                local l_6_85 = (sysio.FindFolders)(l_6_30, "*", 0)
                if l_6_84 ~= nil then
                  local l_6_86 = 0
                  for l_6_90,l_6_91 in pairs(l_6_84) do
                    l_6_86 = l_6_86 + 1
                    -- DECOMPILER ERROR at PC533: Confused about usage of register: R41 in 'UnsetPending'

                    if l_6_29 < l_6_86 then
                      ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC537: Confused about usage of register: R41 in 'UnsetPending'

                      ;
                      ((l_6_9.FolderEnumeration)[l_6_30]).TotalFilesEnumerated = #l_6_84
                      break
                    end
                    local l_6_92 = (string.sub)(l_6_91, l_6_83)
                    if l_6_72 then
                      local l_6_93 = (sysio.GetFileSize)(l_6_91)
                      local l_6_94 = (sysio.GetFileLastWriteTime)(l_6_91)
                      local l_6_95 = table.insert
                      local l_6_96 = ((l_6_9.FolderEnumeration)[l_6_30]).Files
                      local l_6_97 = {}
                      l_6_97.Name = l_6_92
                      l_6_97.Size = l_6_93
                      l_6_97.LastModified = l_6_94
                      l_6_95(l_6_96, l_6_97)
                      l_6_86 = l_6_86 + 1
                    end
                    if l_6_71 then
                      local l_6_98 = l_6_8
                      local l_6_99 = (MpCommon.AtomicCounterAddNamespaced)(l_6_3, l_6_2, 1)
                      -- DECOMPILER ERROR at PC578: Confused about usage of register: R44 in 'UnsetPending'

                      if l_6_98 <= l_6_99 then
                        ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_6_2, (string.lower)(l_6_91), 1, l_6_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_6_91), 0, 5000)
                      end
                    end
                  end
                end
                l_6_86 = table
                l_6_86 = l_6_86.insert
                local l_6_100 = nil
                l_6_100 = l_6_9.Processed
                local l_6_101 = nil
                local l_6_102 = nil
                l_6_86(l_6_100, l_6_101)
                l_6_101 = {enumeratefolder = l_6_30}
                l_6_86 = sysio
                l_6_86 = l_6_86.IsFolderExists
                l_6_100 = l_6_30
                l_6_86 = l_6_86(l_6_100)
                if l_6_86 then
                  l_6_100 = l_6_9.FolderEnumeration
                  l_6_100 = l_6_100[l_6_30]
                  l_6_100.Exists = true
                  l_6_100 = l_6_9.FolderEnumeration
                  l_6_100 = l_6_100[l_6_30]
                  l_6_101 = sysio
                  l_6_101 = l_6_101.IsPathAVExcluded
                  l_6_102 = l_6_30
                  l_6_101 = l_6_101(l_6_102, true)
                  l_6_100.Excluded = l_6_101
                else
                  l_6_100 = l_6_9.FolderEnumeration
                  l_6_100 = l_6_100[l_6_30]
                  l_6_100.Exists = false
                end
                if l_6_72 == false then
                  l_6_100 = #l_6_84
                  if l_6_100 <= l_6_29 then
                    l_6_100 = table
                    l_6_100 = l_6_100.insert
                    l_6_101 = l_6_9.FolderEnumeration
                    l_6_101 = l_6_101[l_6_30]
                    local l_6_103 = nil
                    l_6_100(l_6_101, l_6_102)
                    l_6_102 = {Files = l_6_84}
                  else
                    l_6_101 = 1
                    l_6_102 = l_6_29
                    for i = l_6_101, l_6_102 do
                      local l_6_106 = nil
                      l_6_106 = l_6_84[l_6_105]
                    end
                    local l_6_107 = nil
                    local l_6_108 = nil
                    local l_6_109 = nil
                    ;
                    (table.insert)((l_6_9.FolderEnumeration)[l_6_30], l_6_107)
                    l_6_107 = {Files = l_6_100}
                    -- DECOMPILER ERROR at PC662: Confused about usage of register: R37 in 'UnsetPending'

                    ;
                    ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC666: Confused about usage of register: R37 in 'UnsetPending'

                    ;
                    ((l_6_9.FolderEnumeration)[l_6_30]).TotalFilesEnumerated = #l_6_84
                  end
                end
                -- DECOMPILER ERROR at PC669: Overwrote pending register: R36 in 'AssignReg'

                if l_6_85 ~= nil then
                  for l_6_113,l_6_114 in pairs(l_6_85) do
                    local l_6_113, l_6_114 = nil
                    -- DECOMPILER ERROR at PC674: Overwrote pending register: R36 in 'AssignReg'

                    if l_6_29 < l_6_100 then
                      break
                    end
                    l_6_113 = string
                    l_6_113 = l_6_113.sub
                    l_6_114 = l_6_112
                    l_6_113 = l_6_113(l_6_114, l_6_83)
                    local l_6_115 = nil
                    l_6_114 = table
                    l_6_114 = l_6_114.insert
                    l_6_115 = l_6_9.FolderEnumeration
                    l_6_115 = l_6_115[l_6_30]
                    l_6_115 = l_6_115.Subfolders
                    l_6_114(l_6_115, l_6_113)
                  end
                end
                -- DECOMPILER ERROR at PC692: Overwrote pending register: R36 in 'AssignReg'

                l_6_100("hmdprecisionpulseenumeratefolder", l_6_2, l_6_30, 1, l_6_6, 500, 1)
                -- DECOMPILER ERROR at PC701: Confused about usage of register R38 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_6_29 = l_6_20.enumerateregistrykey
          if l_6_29 then
            l_6_29 = ""
            l_6_30 = l_6_20.enumerateregistrykey
            l_6_69 = split
            l_6_70 = l_6_30
            l_6_71 = ","
            l_6_69 = l_6_69(l_6_70, l_6_71)
            local l_6_116 = nil
            l_6_70 = ipairs
            l_6_71 = l_6_69
            l_6_70 = l_6_70(l_6_71)
            for l_6_73,l_6_74 in l_6_70 do
              local l_6_117, l_6_118, l_6_119, l_6_120, l_6_121 = nil
              l_6_75 = string
              l_6_75 = l_6_75.lower
              l_6_75 = l_6_75((MpCommon.Base64Decode)(l_6_74))
              local l_6_122 = nil
              l_6_29 = l_6_75
              if l_6_29 ~= nil then
                local l_6_123 = nil
                -- DECOMPILER ERROR at PC732: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC736: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC740: Confused about usage of register: R26 in 'UnsetPending'

                if (sysio.RegOpenKey)(l_6_29) then
                  local l_6_124 = nil
                  local l_6_125 = nil
                  if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_6_29)) ~= nil then
                    (table.insert)(((l_6_9.RegkeyEnumeration)[l_6_29]).Keys, l_6_81)
                    -- DECOMPILER ERROR at PC763: Overwrote pending register: R30 in 'AssignReg'

                    do
                      local l_6_126, l_6_127, l_6_128, l_6_129 = nil
                      -- DECOMPILER ERROR at PC772: Confused about usage of register: R29 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC775: Overwrote pending register: R30 in 'AssignReg'

                      -- DECOMPILER ERROR at PC776: Overwrote pending register: R30 in 'AssignReg'

                      -- DECOMPILER ERROR at PC777: Overwrote pending register: R30 in 'AssignReg'

                      -- DECOMPILER ERROR at PC778: Overwrote pending register: R30 in 'AssignReg'

                      -- DECOMPILER ERROR at PC781: Overwrote pending register: R31 in 'AssignReg'

                      ;
                      (table.insert)(l_6_81, l_6_82)
                      -- DECOMPILER ERROR at PC786: Overwrote pending register: R30 in 'AssignReg'

                      if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_6_29)) ~= nil then
                        for l_6_83,l_6_84 in pairs(l_6_81) do
                          local l_6_130, l_6_131, l_6_132, l_6_133, l_6_134 = nil
                          l_6_85 = sysio
                          l_6_85 = l_6_85.GetRegValueType
                          l_6_86 = (sysio.RegOpenKey)(l_6_29)
                          -- DECOMPILER ERROR at PC792: Overwrote pending register: R36 in 'AssignReg'

                          l_6_85 = (l_6_85(l_6_86, l_6_100))
                          local l_6_135 = nil
                          l_6_86 = nil
                          local l_6_136 = nil
                          -- DECOMPILER ERROR at PC797: Overwrote pending register: R36 in 'AssignReg'

                          -- DECOMPILER ERROR at PC798: Overwrote pending register: R36 in 'AssignReg'

                          if l_6_85 == 1 then
                            l_6_100 = l_6_100((sysio.RegOpenKey)(l_6_29), l_6_116)
                            l_6_86 = l_6_100 or "Value not set"
                            l_6_100 = l_6_9.RegkeyEnumeration
                            l_6_100 = l_6_100[l_6_29]
                            l_6_100 = l_6_100.Values
                            l_6_100[l_6_84] = {}
                            l_6_100 = table
                            l_6_100 = l_6_100.insert
                            -- DECOMPILER ERROR at PC816: Overwrote pending register: R38 in 'AssignReg'

                            -- DECOMPILER ERROR at PC818: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84], l_6_116)
                          elseif l_6_85 == 2 then
                            l_6_100 = sysio
                            l_6_100 = l_6_100.GetRegValueAsString
                            -- DECOMPILER ERROR at PC826: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100 = l_6_100((sysio.RegOpenKey)(l_6_29), l_6_116)
                            l_6_86 = l_6_100 or "Value not set"
                            l_6_100 = l_6_9.RegkeyEnumeration
                            l_6_100 = l_6_100[l_6_29]
                            l_6_100 = l_6_100.Values
                            l_6_100[l_6_84] = {}
                            l_6_100 = table
                            l_6_100 = l_6_100.insert
                            -- DECOMPILER ERROR at PC842: Overwrote pending register: R38 in 'AssignReg'

                            -- DECOMPILER ERROR at PC843: Overwrote pending register: R39 in 'AssignReg'

                            -- DECOMPILER ERROR at PC844: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84], l_6_116)
                          elseif l_6_85 == 3 then
                            l_6_100 = sysio
                            l_6_100 = l_6_100.GetRegValueAsBinary
                            -- DECOMPILER ERROR at PC852: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100 = l_6_100((sysio.RegOpenKey)(l_6_29), l_6_116)
                            l_6_86 = l_6_100 or "Value not set"
                            l_6_100 = l_6_9.RegkeyEnumeration
                            l_6_100 = l_6_100[l_6_29]
                            l_6_100 = l_6_100.Values
                            l_6_100[l_6_84] = {}
                            l_6_100 = table
                            l_6_100 = l_6_100.insert
                            -- DECOMPILER ERROR at PC868: Overwrote pending register: R38 in 'AssignReg'

                            -- DECOMPILER ERROR at PC869: Overwrote pending register: R39 in 'AssignReg'

                            -- DECOMPILER ERROR at PC870: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84], l_6_116)
                          elseif l_6_85 == 4 then
                            l_6_100 = sysio
                            l_6_100 = l_6_100.GetRegValueAsDword
                            -- DECOMPILER ERROR at PC878: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100 = l_6_100((sysio.RegOpenKey)(l_6_29), l_6_116)
                            l_6_86 = l_6_100 or "Value not set"
                            l_6_100 = l_6_9.RegkeyEnumeration
                            l_6_100 = l_6_100[l_6_29]
                            l_6_100 = l_6_100.Values
                            l_6_100[l_6_84] = {}
                            l_6_100 = table
                            l_6_100 = l_6_100.insert
                            -- DECOMPILER ERROR at PC894: Overwrote pending register: R38 in 'AssignReg'

                            -- DECOMPILER ERROR at PC895: Overwrote pending register: R39 in 'AssignReg'

                            -- DECOMPILER ERROR at PC896: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84], l_6_116)
                          elseif l_6_85 == 7 then
                            l_6_100 = sysio
                            l_6_100 = l_6_100.GetRegValueAsMultiString
                            -- DECOMPILER ERROR at PC904: Overwrote pending register: R38 in 'AssignReg'

                            l_6_100 = l_6_100((sysio.RegOpenKey)(l_6_29), l_6_116)
                            l_6_86 = l_6_100 or "Value not set"
                            l_6_100 = l_6_9.RegkeyEnumeration
                            l_6_100 = l_6_100[l_6_29]
                            l_6_100 = l_6_100.Values
                            l_6_100[l_6_84] = {}
                            l_6_100 = ipairs
                            l_6_100 = l_6_100(l_6_86)
                            for l_6_117,l_6_118 in l_6_100 do
                              local l_6_137, l_6_138, l_6_139, l_6_140, l_6_141 = nil
                              l_6_119 = table
                              l_6_119 = l_6_119.insert
                              l_6_120 = l_6_9.RegkeyEnumeration
                              l_6_120 = l_6_120[l_6_29]
                              l_6_120 = l_6_120.Values
                              l_6_120 = l_6_120[l_6_84]
                              l_6_121 = l_6_118
                              l_6_122 = " (REG_MULTI_SZ)"
                              l_6_121 = l_6_121 .. l_6_122
                              l_6_119(l_6_120, l_6_121)
                            end
                          else
                            -- DECOMPILER ERROR at PC936: Overwrote pending register: R38 in 'AssignReg'

                            if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_6_29), l_6_116) then
                              l_6_86 = l_6_85 ~= 11 or "Value not set"
                            end
                            -- DECOMPILER ERROR at PC945: Confused about usage of register: R36 in 'UnsetPending'

                            ;
                            (((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84] = {}
                            -- DECOMPILER ERROR at PC953: Overwrote pending register: R39 in 'AssignReg'

                            ;
                            (table.insert)((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84], (l_6_86) .. l_6_117)
                          end
                          l_6_86 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_6_29), l_6_84) or "Value not set"
                          -- DECOMPILER ERROR at PC969: Confused about usage of register: R36 in 'UnsetPending'

                          ;
                          (((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84] = {}
                          ;
                          (table.insert)((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_84], (l_6_86) .. " (UNKNOWN TYPE)")
                        end
                      end
                      local l_6_142 = nil
                      local l_6_143 = nil
                      do
                        local l_6_144 = nil
                        ;
                        (table.insert)(l_6_9.Processed, {enumerateregistrykey = l_6_29})
                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out DO_STMT

                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out IF_STMT

                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out IF_THEN_STMT

                        -- DECOMPILER ERROR at PC988: LeaveBlock: unexpected jumping out IF_STMT

                      end
                    end
                  end
                end
              end
            end
          end
          l_6_29 = l_6_20.deleteregistryvalue
          if l_6_29 then
            l_6_29 = ""
            l_6_30 = l_6_20.deleteregistryvalue
            l_6_69 = split
            l_6_69 = l_6_69(l_6_30, ",")
            local l_6_145 = nil
            for l_6_149,l_6_150 in ipairs(l_6_69) do
              local l_6_146, l_6_147, l_6_148, l_6_149, l_6_150 = nil
              l_6_75 = string
              l_6_75 = l_6_75.lower
              -- DECOMPILER ERROR at PC1007: Confused about usage of register: R23 in 'UnsetPending'

              l_6_75 = l_6_75((MpCommon.Base64Decode)(l_6_74))
              local l_6_151 = nil
              if l_6_29 ~= nil then
                l_6_29 = explode(l_6_75, "|")
                if #l_6_29 == 2 then
                  local l_6_152 = nil
                  local l_6_153 = nil
                  -- DECOMPILER ERROR at PC1024: Confused about usage of register: R27 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1027: Confused about usage of register: R25 in 'UnsetPending'

                  local l_6_154 = nil
                  if (sysio.RegOpenKey)(l_6_29[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1038: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1038: Overwrote pending register: R30 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1039: Overwrote pending register: R31 in 'AssignReg'

                    local l_6_155 = nil
                    -- DECOMPILER ERROR at PC1044: Overwrote pending register: R32 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_6_2, l_6_83, 1, l_6_85, l_6_86, 1)
                    local l_6_156, l_6_157 = nil
                    -- DECOMPILER ERROR at PC1060: Confused about usage of register: R25 in 'UnsetPending'

                    ;
                    (mp.TriggerScanResource)("regkey", l_6_29[1])
                    -- DECOMPILER ERROR at PC1065: Overwrote pending register: R34 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1066: Overwrote pending register: R35 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_6_2, l_6_85, l_6_86, l_6_6, 500, 1)
                    -- DECOMPILER ERROR at PC1075: Overwrote pending register: R34 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1076: Overwrote pending register: R35 in 'AssignReg'

                    local l_6_158, l_6_159 = nil
                    -- DECOMPILER ERROR at PC1080: Overwrote pending register: R34 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1081: Overwrote pending register: R35 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)(l_6_85, l_6_86)
                  else
                    -- DECOMPILER ERROR at PC1085: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1085: Confused about usage of register: R28 in 'UnsetPending'

                  end
                  local l_6_160 = nil
                  -- DECOMPILER ERROR at PC1088: Overwrote pending register: R29 in 'AssignReg'

                  local l_6_161 = nil
                  local l_6_162 = nil
                  -- DECOMPILER ERROR at PC1090: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1090: Overwrote pending register: R31 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1092: Confused about usage of register: R26 in 'UnsetPending'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_6_2, (string.format)("%s\\\\%s", l_6_81, l_6_82)), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", l_6_85, l_6_86) .. " " .. l_6_29[2]})
                end
              end
            end
          end
          l_6_29 = l_6_20.process
          if l_6_29 then
            l_6_29 = mp
            l_6_29 = l_6_29.get_contextdata
            l_6_30 = mp
            l_6_30 = l_6_30.CONTEXT_DATA_PROCESS_PPID
            l_6_29 = l_6_29(l_6_30)
            if l_6_29 == nil then
              l_6_30 = MpCommon
              l_6_30 = l_6_30.ExpandEnvironmentVariables
              l_6_69 = "%windir%"
              l_6_30 = l_6_30(l_6_69)
              l_6_69 = l_6_30
              l_6_69 = l_6_69 .. "\\system32\\"
              local l_6_163 = nil
              local l_6_164 = nil
              if #(sysio.GetProcessFromFileName)(l_6_69 .. "services.exe") > 0 then
                l_6_29 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_6_69 .. "services.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_6_69 .. "services.exe"))[1]).starttime)
              end
            end
            l_6_30 = table
            l_6_30 = l_6_30.insert
            l_6_69 = l_6_9.Processed
            local l_6_165 = nil
            local l_6_166 = nil
            l_6_30(l_6_69, {process = l_6_20.process})
            l_6_30 = MpCommon
            l_6_30 = l_6_30.BmTriggerSig
            l_6_69 = l_6_29
            l_6_30(l_6_69, "Heimdall_ProcessDispatch", l_6_20.process)
          end
          l_6_29 = l_6_20.firewall
          if l_6_29 then
            l_6_29 = l_6_20.firewall
            l_6_30 = split
            l_6_69 = l_6_29
            l_6_30 = l_6_30(l_6_69, ",")
            l_6_69 = ipairs
            l_6_69 = l_6_69(l_6_30)
            for l_6_170,l_6_171 in l_6_69 do
              local l_6_167, l_6_168, l_6_169, l_6_170, l_6_171 = nil
              -- DECOMPILER ERROR at PC1160: Confused about usage of register: R22 in 'UnsetPending'

              local l_6_172 = nil
              -- DECOMPILER ERROR at PC1164: Overwrote pending register: R24 in 'AssignReg'

              -- DECOMPILER ERROR at PC1165: Overwrote pending register: R24 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_75) then
                local l_6_173 = nil
                local l_6_174 = nil
                local l_6_175 = nil
                l_6_75(l_6_9.Processed, {firewall = (MpCommon.Base64Decode)(l_6_75)})
                -- DECOMPILER ERROR at PC1170: Overwrote pending register: R24 in 'AssignReg'

                l_6_75 = l_6_75((MpCommon.Base64Decode)(l_6_75), "_")
                l_6_75 = #l_6_75
                if l_6_75 == 3 then
                  l_6_75 = tonumber
                  -- DECOMPILER ERROR at PC1179: Confused about usage of register: R23 in 'UnsetPending'

                  l_6_75 = l_6_75(l_6_75[2])
                  -- DECOMPILER ERROR at PC1183: Confused about usage of register: R23 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1185: Confused about usage of register: R23 in 'UnsetPending'

                  local l_6_176 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_6_75[1], tonumber(l_6_75[3]), (mp.bitand)(l_6_75, 2) == 2, (mp.bitand)(l_6_75, 1) == 1)
                end
              end
            end
          end
          l_6_29 = l_6_20.sinkholedns
          if l_6_29 then
            l_6_29 = l_6_20.sinkholedns
            l_6_30 = split
            l_6_30 = l_6_30(l_6_29, ",")
            for l_6_185,l_6_186 in ipairs(l_6_30) do
              local l_6_182, l_6_183, l_6_184, l_6_185, l_6_186 = nil
              -- DECOMPILER ERROR at PC1222: Confused about usage of register: R22 in 'UnsetPending'

              local l_6_187 = nil
              -- DECOMPILER ERROR at PC1224: Overwrote pending register: R24 in 'AssignReg'

              -- DECOMPILER ERROR at PC1225: Overwrote pending register: R24 in 'AssignReg'

              local l_6_188 = nil
              local l_6_189 = nil
              local l_6_190 = nil
              l_6_75(l_6_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_6_75)})
              -- DECOMPILER ERROR at PC1232: Overwrote pending register: R24 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_75) then
                l_6_75 = l_6_75((MpCommon.Base64Decode)(l_6_75), "_")
                -- DECOMPILER ERROR at PC1238: Overwrote pending register: R24 in 'AssignReg'

                -- DECOMPILER ERROR at PC1241: Confused about usage of register: R23 in 'UnsetPending'

                l_6_75 = l_6_75(l_6_75[1], tonumber(l_6_75[2]))
                -- DECOMPILER ERROR at PC1246: Confused about usage of register: R23 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1248: Confused about usage of register: R23 in 'UnsetPending'

                local l_6_191 = nil
                l_6_9["sinkholedns" .. "_" .. l_6_75[1] .. "_" .. l_6_75[2]] = {res = l_6_75, isAllowed = l_6_75[1]}
              end
            end
          end
          l_6_29 = l_6_20.dnscache
          if l_6_29 then
            l_6_29 = l_6_20.dnscache
            l_6_30 = split
            l_6_30 = l_6_30(l_6_29, ",")
            for l_6_195,l_6_196 in ipairs(l_6_30) do
              local l_6_192, l_6_193, l_6_194, l_6_195, l_6_196 = nil
              -- DECOMPILER ERROR at PC1270: Confused about usage of register: R22 in 'UnsetPending'

              local l_6_197 = nil
              -- DECOMPILER ERROR at PC1272: Overwrote pending register: R24 in 'AssignReg'

              -- DECOMPILER ERROR at PC1273: Overwrote pending register: R24 in 'AssignReg'

              local l_6_198 = nil
              local l_6_199 = nil
              local l_6_200 = nil
              l_6_75(l_6_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_6_75)})
              -- DECOMPILER ERROR at PC1280: Overwrote pending register: R24 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_75) then
                l_6_75 = l_6_75((MpCommon.Base64Decode)(l_6_75), "_")
                for i_1,i_2 in ipairs(l_6_75) do
                  local l_6_201, l_6_202, l_6_203 = nil
                  l_6_9["dnscache" .. "_" .. i_2], l_6_75 = l_6_75, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_6_29 = l_6_20.debug
          if l_6_29 then
            l_6_29 = l_6_20.debug
            l_6_30 = split
            l_6_30 = l_6_30(l_6_29, ",")
            local l_6_204 = nil
            for l_6_208,l_6_209 in ipairs(l_6_30) do
              local l_6_205, l_6_206, l_6_207, l_6_208, l_6_209 = nil
              l_6_75 = MpCommon
              l_6_75 = l_6_75.Base64Decode
              -- DECOMPILER ERROR at PC1319: Confused about usage of register: R23 in 'UnsetPending'

              l_6_75 = l_6_75(l_6_75)
              local l_6_210 = nil
              local l_6_211 = nil
              local l_6_212 = nil
              local l_6_213 = nil
              ;
              (table.insert)(l_6_9.Processed, {debug = l_6_75})
              for l_6_217,l_6_218 in ipairs((split(l_6_75, "_"))) do
                local l_6_214, l_6_215, l_6_216, l_6_217, l_6_218 = nil
                -- DECOMPILER ERROR at PC1337: Confused about usage of register: R32 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1337: Overwrote pending register: R34 in 'AssignReg'

                -- DECOMPILER ERROR at PC1338: Overwrote pending register: R35 in 'AssignReg'

                -- DECOMPILER ERROR at PC1341: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1342: Confused about usage of register: R32 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1342: Overwrote pending register: R27 in 'AssignReg'

                -- DECOMPILER ERROR at PC1345: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1346: Overwrote pending register: R34 in 'AssignReg'

                -- DECOMPILER ERROR at PC1347: Overwrote pending register: R35 in 'AssignReg'

                if nil == "PC" then
                  local l_6_219 = nil
                  -- DECOMPILER ERROR at PC1349: Overwrote pending register: R34 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1350: Overwrote pending register: R35 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1353: Confused about usage of register: R27 in 'UnsetPending'

                else
                  -- DECOMPILER ERROR at PC1358: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1360: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1361: Overwrote pending register: R34 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1362: Confused about usage of register: R27 in 'UnsetPending'

                  if nil == "PCNP" then
                    local l_6_220 = nil
                    -- DECOMPILER ERROR at PC1364: Overwrote pending register: R34 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1368: Confused about usage of register: R27 in 'UnsetPending'

                  else
                    -- DECOMPILER ERROR at PC1373: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1375: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1376: Overwrote pending register: R34 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1377: Confused about usage of register: R27 in 'UnsetPending'

                    if nil == "RQ" then
                      local l_6_221 = nil
                      -- DECOMPILER ERROR at PC1379: Overwrote pending register: R34 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1383: Confused about usage of register: R27 in 'UnsetPending'

                    else
                      -- DECOMPILER ERROR at PC1388: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1390: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1391: Overwrote pending register: R34 in 'AssignReg'

                      -- DECOMPILER ERROR at PC1392: Confused about usage of register: R27 in 'UnsetPending'

                      if nil == "AC" then
                        local l_6_222 = nil
                        -- DECOMPILER ERROR at PC1394: Overwrote pending register: R34 in 'AssignReg'

                        -- DECOMPILER ERROR at PC1398: Confused about usage of register: R27 in 'UnsetPending'

                      end
                    end
                  end
                end
              end
            end
            l_6_9.debug = {[nil .. l_6_85 .. l_6_86] = l_6_85, [nil .. l_6_85 .. nil] = l_6_85, [nil .. l_6_85 .. nil] = l_6_85, [nil .. l_6_85 .. nil] = l_6_85}
          end
          l_6_29 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_6_10.report = safeJsonSerialize(l_6_9, 260)
          l_6_10.TAG = "NOLOOKUP"
          SafeGetUrlReputation(l_6_30, l_6_10, false, 2000)
          -- DECOMPILER ERROR at PC1422: Confused about usage of register R40 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 61 unprocessed JMP targets
        end
      end
    end
  end
end


