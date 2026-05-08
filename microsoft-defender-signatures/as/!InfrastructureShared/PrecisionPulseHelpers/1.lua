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

ReportResource = function(l_3_0, l_3_1, l_3_2, l_3_3)
  -- function num : 0_2
  if not l_3_2 then
    l_3_2 = {}
  end
  if not l_3_1 or not l_3_0 then
    return 
  end
  local l_3_4 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  local l_3_5 = 64500
  local l_3_6 = 1000
  local l_3_7 = 320
  local l_3_8 = #l_3_1
  local l_3_9 = 1
  do
    local l_3_10 = 0
    while 1 do
      if l_3_9 <= l_3_8 and l_3_10 < l_3_7 then
        local l_3_11 = l_3_1:sub(l_3_9, l_3_9 + l_3_5 - 1)
        l_3_9 = l_3_9 + l_3_5
        local l_3_12 = {}
        l_3_12.SIG_CONTEXT = "Lua_Custom_Upload_Resource"
        l_3_12.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
        l_3_12.TAG = "NOLOOKUP"
        l_3_12.ResourceName = l_3_0
        l_3_12.ResourceInfo = safeJsonSerialize(l_3_2)
        l_3_12.Index = l_3_10
        l_3_12.Source = l_3_3
        local l_3_13 = 1
        local l_3_14 = 0
        local l_3_15 = #l_3_11
        local l_3_16 = 0
        while 1 do
          if l_3_13 <= l_3_15 then
            local l_3_17 = l_3_11:sub(l_3_13, l_3_13 + l_3_6 - 1)
            local l_3_18 = #l_3_17
          end
          if l_3_5 < l_3_16 + l_3_18 then
            break
          end
          l_3_12["ResourceContent_" .. l_3_14] = l_3_17
          l_3_16 = l_3_16 + l_3_18
          l_3_13 = l_3_13 + l_3_6
          l_3_14 = l_3_14 + 1
        end
        do
          do
            local l_3_19 = {}
            l_3_19[1] = l_3_4 .. "?indx=" .. l_3_10
            -- DECOMPILER ERROR at PC77: LeaveBlock: unexpected jumping out DO_STMT

            -- DECOMPILER ERROR at PC77: LeaveBlock: unexpected jumping out IF_THEN_STMT

            -- DECOMPILER ERROR at PC77: LeaveBlock: unexpected jumping out IF_STMT

          end
        end
      end
    end
    -- WARNING: undefined locals caused missing assignments!
  end
end

MamadutReport = function()
  -- function num : 0_3
  local l_4_0 = reportRelevantUntrustedEntities(0)
  if l_4_0 and next(l_4_0) then
    (bm.add_related_string)("UntrustedEntities", safeJsonSerialize(l_4_0), bm.RelatedStringBMReport)
    local l_4_1 = {}
    -- DECOMPILER ERROR at PC51: No list found for R1 , SetList fails

    -- DECOMPILER ERROR at PC52: Overwrote pending register: R2 in 'AssignReg'

    -- DECOMPILER ERROR at PC53: Overwrote pending register: R3 in 'AssignReg'

    for l_4_5,l_4_6 in (".dll")(".jar") do
      -- DECOMPILER ERROR at PC56: Overwrote pending register: R7 in 'AssignReg'

      -- DECOMPILER ERROR at PC58: Overwrote pending register: R8 in 'AssignReg'

      if ((".html").IsFileExists)(".pdb") then
        local l_4_7 = true
        -- DECOMPILER ERROR at PC64: Overwrote pending register: R9 in 'AssignReg'

        -- DECOMPILER ERROR at PC65: Overwrote pending register: R10 in 'AssignReg'

        -- DECOMPILER ERROR at PC73: Overwrote pending register: R11 in 'AssignReg'

        if Contains_any_caseinsenstive(".7z", ".xz") and (not (string.find)(l_4_6, ".dll", ".001", true) or (mp.IsKnownFriendlyFile)(l_4_6, true, false) ~= true or l_4_7) then
          local l_4_8 = (sysio.GetFileSize)(l_4_6)
          local l_4_9 = (sysio.GetFileLastWriteTime)(l_4_6)
          local l_4_10 = {}
          -- DECOMPILER ERROR at PC102: Overwrote pending register: R13 in 'AssignReg'

          -- DECOMPILER ERROR at PC103: Overwrote pending register: R14 in 'AssignReg'

          local l_4_11, l_4_12, l_4_13, l_4_14, l_4_15, l_4_16 = pcall(CollectFile, ".zip", ".rar", true), ".cpp"
          -- DECOMPILER ERROR at PC114: Overwrote pending register: R17 in 'AssignReg'

          -- DECOMPILER ERROR at PC115: Overwrote pending register: R18 in 'AssignReg'

          -- DECOMPILER ERROR at PC116: Overwrote pending register: R19 in 'AssignReg'

          -- DECOMPILER ERROR at PC117: Overwrote pending register: R20 in 'AssignReg'

          -- DECOMPILER ERROR at PC118: Overwrote pending register: R21 in 'AssignReg'

          if l_4_11 then
            if l_4_12 then
              (".cs")(".c", ".csproj", ".sln", ".ps1")
              ;
              (bm.add_related_string)("FileReported_" .. l_4_6, safeJsonSerialize(l_4_10), bm.RelatedStringBMReport)
            else
              ;
              (bm.add_related_string)("FileReadFailed_" .. l_4_6, safeJsonSerialize(l_4_10), bm.RelatedStringBMReport)
            end
          end
        end
      end
    end
  end
  do
    do
      local l_4_17, l_4_18 = nil
      -- DECOMPILER ERROR at PC155: Overwrote pending register: R3 in 'AssignReg'

      if not l_4_1 and l_4_17 then
        l_4_18("bmInfoFailReason", tostring(l_4_17), bm.RelatedStringBMReport)
      end
      -- DECOMPILER ERROR at PC163: Overwrote pending register: R3 in 'AssignReg'

      l_4_18()
      -- DECOMPILER ERROR at PC165: Overwrote pending register: R3 in 'AssignReg'

      l_4_18()
      -- DECOMPILER ERROR at PC167: Overwrote pending register: R3 in 'AssignReg'

      l_4_18()
      do return  end
      -- WARNING: undefined locals caused missing assignments!
    end
  end
end

EnablePrecisionPulse = function(l_5_0, l_5_1, l_5_2, l_5_3, l_5_4)
  -- function num : 0_4
  local l_5_5 = 60
  local l_5_6 = 300
  local l_5_7 = nil
  local l_5_8 = 500
  local l_5_9 = {}
  l_5_9.Processed = {}
  l_5_9.FolderEnumeration = {}
  l_5_9.ScanPath = {}
  l_5_9.FullFilePathScan = {}
  l_5_9.RegkeyEnumeration = {}
  l_5_9.DeleteRegValue = {}
  local l_5_10 = {}
  l_5_10.SIG_CONTEXT = "LUA_GENERIC"
  l_5_10.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
  l_5_10.TAG = "NOLOOKUP"
  local l_5_11 = {}
  for l_5_15 in l_5_0:gmatch("[^%+][^%+]+") do
    local l_5_16, l_5_17 = l_5_15:match("(.+)::(.+)")
    if l_5_16 and l_5_17 then
      l_5_11[l_5_16] = l_5_17
    end
  end
  local l_5_18 = {}
  local l_5_19 = l_5_11
  for l_5_23,l_5_24 in pairs(l_5_19) do
    local l_5_25 = l_5_23
    l_5_18[l_5_25] = l_5_24
  end
  if l_5_18.tracking_id then
    l_5_7 = l_5_18.tracking_id
  end
  if l_5_7 == nil then
    l_5_7 = "10000000-0000-ffff-0000-000000000001"
  end
  local l_5_26 = table.insert
  local l_5_27 = l_5_9.Processed
  local l_5_28 = {}
  l_5_28.TrackingId = l_5_7
  l_5_26(l_5_27, l_5_28)
  l_5_26 = l_5_18.ttl
  if l_5_26 then
    l_5_6 = l_5_18.ttl
    l_5_26 = table
    l_5_26 = l_5_26.insert
    l_5_27 = l_5_9.Processed
    l_5_26(l_5_27, l_5_28)
    l_5_28 = {Ttl = l_5_6}
  end
  l_5_26 = l_5_18.suppress_ttl
  if l_5_26 then
    l_5_5 = l_5_18.suppress_ttl
    l_5_26 = table
    l_5_26 = l_5_26.insert
    l_5_27 = l_5_9.Processed
    l_5_26(l_5_27, l_5_28)
    l_5_28 = {suppress_ttl = l_5_5}
  end
  l_5_26 = MpCommon
  l_5_26 = l_5_26.AtomicCounterValueNamespaced
  l_5_27 = l_5_3
  l_5_28 = l_5_2
  l_5_26 = l_5_26(l_5_27, l_5_28)
  if l_5_26 == nil then
    l_5_27 = MpCommon
    l_5_27 = l_5_27.AtomicCounterSetNamespaced
    l_5_28 = l_5_3
    l_5_27(l_5_28, l_5_2, 0, l_5_5)
  end
  l_5_27 = l_5_18.maxscan
  if l_5_27 then
    l_5_27 = tonumber
    l_5_28 = l_5_18.maxscan
    l_5_27 = l_5_27(l_5_28)
    l_5_8 = l_5_27 or 500
    l_5_27 = MpCommon
    l_5_27 = l_5_27.AtomicCounterValueNamespaced
    l_5_28 = l_5_4
    l_5_27 = l_5_27(l_5_28, l_5_2)
    if l_5_27 == nil then
      l_5_28 = MpCommon
      l_5_28 = l_5_28.AtomicCounterSetNamespaced
      l_5_28(l_5_4, l_5_2, l_5_8, l_5_6)
    else
      l_5_28 = MpCommon
      l_5_28 = l_5_28.AtomicCounterSubNamespaced
      l_5_28(l_5_4, l_5_2, l_5_27)
      l_5_28 = MpCommon
      l_5_28 = l_5_28.AtomicCounterAddNamespaced
      l_5_28(l_5_4, l_5_2, l_5_8)
    end
    l_5_28 = table
    l_5_28 = l_5_28.insert
    local l_5_29 = l_5_9.Processed
    local l_5_30 = {}
    l_5_30.max_scan = l_5_8
    l_5_28(l_5_29, l_5_30)
  end
  do
    l_5_27 = l_5_18.scanpath
    if l_5_27 then
      l_5_27 = l_5_18.scanpath
      l_5_28 = split
      l_5_28 = l_5_28(l_5_27, ",")
      for l_5_34,l_5_35 in ipairs(l_5_28) do
        local l_5_36 = (string.lower)((MpCommon.Base64Decode)(l_5_35))
        local l_5_37 = table.insert
        local l_5_38 = l_5_9.Processed
        local l_5_39 = {}
        l_5_39.scanpath = l_5_36
        l_5_37(l_5_38, l_5_39)
        l_5_37 = AppendToRollingQueueNamespaced
        l_5_38 = "hmdprecisionpulsefolderscan"
        l_5_39 = l_5_2
        l_5_37(l_5_38, l_5_39, l_5_36, 1, l_5_6, 500, 1)
        l_5_37 = mp
        l_5_37 = l_5_37.TriggerScanResource
        l_5_38 = "folder"
        l_5_39 = l_5_36
        l_5_37(l_5_38, l_5_39, 0, 5000)
        l_5_37 = l_5_9.ScanPath
        l_5_37[l_5_36], l_5_38 = l_5_38, {}
        l_5_37 = table
        l_5_37 = l_5_37.insert
        l_5_38 = l_5_9.Processed
        l_5_37(l_5_38, l_5_39)
        l_5_39 = {scanpath = l_5_36}
        l_5_37 = sysio
        l_5_37 = l_5_37.IsFolderExists
        l_5_38 = l_5_36
        l_5_37 = l_5_37(l_5_38)
        if l_5_37 then
          l_5_38 = l_5_9.ScanPath
          l_5_38 = l_5_38[l_5_36]
          l_5_38.Exists = true
          l_5_38 = l_5_9.ScanPath
          l_5_38 = l_5_38[l_5_36]
          l_5_39 = sysio
          l_5_39 = l_5_39.IsPathAVExcluded
          l_5_39 = l_5_39(l_5_36, true)
          l_5_38.Excluded = l_5_39
        else
          l_5_38 = l_5_9.ScanPath
          l_5_38 = l_5_38[l_5_36]
          l_5_38.Exists = false
        end
      end
    end
    do
      l_5_27 = l_5_18.fullfilepathscan
      if l_5_27 then
        l_5_27 = l_5_18.fullfilepathscan
        l_5_28 = split
        l_5_28 = l_5_28(l_5_27, ",")
        for l_5_43,l_5_44 in ipairs(l_5_28) do
          local l_5_45 = (string.lower)((MpCommon.Base64Decode)(l_5_44))
          if (string.find)(l_5_45, "\\windows defender\\support", 1, true) then
            pcall(ReportSupportLog)
          end
          local l_5_46 = (sysio.IsFileExists)(l_5_45)
          local l_5_47 = table.insert
          local l_5_48 = l_5_9.Processed
          local l_5_49 = {}
          l_5_49.fullfilepathscan = l_5_45
          l_5_47(l_5_48, l_5_49)
          l_5_47 = l_5_9.FullFilePathScan
          l_5_47[l_5_45], l_5_48 = l_5_48, {}
          l_5_47 = true
          if l_5_46 then
            l_5_48 = string
            l_5_48 = l_5_48.match
            l_5_49 = l_5_45
            l_5_48 = l_5_48(l_5_49, "(.-)[\\/][^\\/]*$")
            l_5_49 = l_5_9.FullFilePathScan
            l_5_49 = l_5_49[l_5_45]
            l_5_49.Exists = true
            l_5_49 = pcall
            l_5_49 = l_5_49(IsAVExcluded, l_5_48)
            do
              if IsAVExcluded == nil then
                local l_5_50, l_5_51, l_5_52 = false
              end
              -- DECOMPILER ERROR at PC278: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_5_9.FullFilePathScan)[l_5_45]).Excluded = (sysio.IsPathAVExcluded)(l_5_48, true)
              -- DECOMPILER ERROR at PC281: Confused about usage of register: R27 in 'UnsetPending'

              -- DECOMPILER ERROR at PC281: Confused about usage of register: R28 in 'UnsetPending'

              ;
              ((l_5_9.FullFilePathScan)[l_5_45]).Excluded_LUA_API = l_5_50
              -- DECOMPILER ERROR at PC287: Confused about usage of register: R27 in 'UnsetPending'

              if ((l_5_9.FullFilePathScan)[l_5_45]).Excluded == true and l_5_50 == true then
                l_5_47 = false
              end
              l_5_47 = false
              l_5_48 = l_5_9.FullFilePathScan
              l_5_48 = l_5_48[l_5_45]
              l_5_48.Exists = false
              l_5_48 = pcallEx
              l_5_49 = "AppendToRollingQueueNamespaced"
              l_5_48 = l_5_48(l_5_49, AppendToRollingQueueNamespaced, "hmdprecisionpulsefullfilepathscan", l_5_2, l_5_45, 1, l_5_6, 500, 1)
              do
                if not l_5_48 then
                  local l_5_53 = GetRollingQueueKeys("LuaError")
                  -- DECOMPILER ERROR at PC324: Confused about usage of register: R28 in 'UnsetPending'

                  if l_5_53 and type(l_5_53) == "table" then
                    ((l_5_9.FullFilePathScan)[l_5_45]).RQErrors = safeJsonSerialize(l_5_53, 260)
                  end
                end
                if l_5_47 then
                  (mp.TriggerScanResource)("file", l_5_45, 0, 10000)
                  local l_5_54 = (MpCommon.ExpandEnvironmentVariables)("%windir%")
                  if l_5_54 then
                    local l_5_55 = l_5_54 .. "\\system32\\"
                    local l_5_56 = (sysio.GetProcessFromFileName)(l_5_55 .. "services.exe")
                    if #l_5_56 > 0 then
                      local l_5_57 = (string.format)("pid:%d,ProcessStart:%u", (l_5_56[1]).pid, (l_5_56[1]).starttime)
                      if l_5_57 then
                        (MpCommon.BmTriggerSig)(l_5_57, "hmdprecisionpulsefullfilepathscan_statuscheck", l_5_45)
                      end
                    end
                  end
                else
                  do
                    if l_5_46 then
                      local l_5_58 = (sysio.GetFileSize)(l_5_45)
                      local l_5_59 = (sysio.GetFileLastWriteTime)(l_5_45)
                      -- DECOMPILER ERROR at PC382: Confused about usage of register: R29 in 'UnsetPending'

                      ;
                      ((l_5_9.FullFilePathScan)[l_5_45]).ExcludedFileInfo = {}
                      local l_5_60 = table.insert
                      local l_5_61 = ((l_5_9.FullFilePathScan)[l_5_45]).ExcludedFileInfo
                      local l_5_62 = {}
                      l_5_62.Size = l_5_58
                      l_5_62.LastModified = l_5_59
                      l_5_60(l_5_61, l_5_62)
                      l_5_60 = pcall
                      l_5_61 = CollectFile
                      l_5_62 = l_5_45
                      l_5_60 = l_5_60(l_5_61, l_5_62, l_5_58, true)
                      local l_5_63, l_5_64, l_5_65 = nil
                      -- DECOMPILER ERROR at PC404: Confused about usage of register: R35 in 'UnsetPending'

                      if l_5_60 then
                        if l_5_61 then
                          ((l_5_9.FullFilePathScan)[l_5_45]).Sha1 = l_5_62
                          -- DECOMPILER ERROR at PC407: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_5_9.FullFilePathScan)[l_5_45]).Sha256 = l_5_63
                          -- DECOMPILER ERROR at PC410: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_5_9.FullFilePathScan)[l_5_45]).PartialSha1 = l_5_64
                          -- DECOMPILER ERROR at PC413: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_5_9.FullFilePathScan)[l_5_45]).PartialSha256 = l_5_65
                          pcall(ReportResource, l_5_45, R38_PC421, (l_5_9.FullFilePathScan)[l_5_45], "LUA")
                        else
                          -- DECOMPILER ERROR at PC425: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_5_9.FullFilePathScan)[l_5_45]).Error_Facility = l_5_62
                          -- DECOMPILER ERROR at PC428: Confused about usage of register: R35 in 'UnsetPending'

                          ;
                          ((l_5_9.FullFilePathScan)[l_5_45]).Error_Code = l_5_63
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
      l_5_27 = l_5_18.scanfile
      if l_5_27 then
        l_5_27 = l_5_18.scanfile
        l_5_28 = split
        l_5_28 = l_5_28(l_5_27, ",")
        for l_5_69,l_5_70 in ipairs(l_5_28) do
          local l_5_71 = (string.lower)((MpCommon.Base64Decode)(l_5_70))
          local l_5_72 = table.insert
          local l_5_73 = l_5_9.Processed
          local l_5_74 = {}
          l_5_74.scanfile = l_5_71
          l_5_72(l_5_73, l_5_74)
          l_5_72 = AppendToRollingQueueNamespaced
          l_5_73 = "hmdprecisionpulsescanfile"
          l_5_74 = l_5_2
          l_5_72(l_5_73, l_5_74, l_5_71, 1, l_5_6, 500, 1)
        end
      end
      do
        do
          l_5_27 = l_5_18.enumeratefolder
          if l_5_27 then
            l_5_27 = 260
            l_5_28 = ""
            local l_5_75 = "*"
            local l_5_76 = 0
            local l_5_77 = true
            local l_5_78 = false
            local l_5_79 = l_5_18.enumeratefolder
            local l_5_80 = split(l_5_79, ",")
            local l_5_81 = 0
            for l_5_85,l_5_86 in ipairs(l_5_80) do
              l_5_81 = l_5_81 + 1
              -- DECOMPILER ERROR at PC491: Confused about usage of register: R29 in 'UnsetPending'

              if l_5_27 < l_5_81 then
                ((l_5_9.FolderEnumeration)[l_5_28]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_5_87 = (string.lower)((MpCommon.Base64Decode)(l_5_86))
              local l_5_88 = explode(l_5_87, "|")
              if #l_5_88 == 4 then
                l_5_28 = l_5_88[1]
                l_5_75 = l_5_88[2]
                l_5_76 = tonumber(l_5_88[3]) or 0
                l_5_77 = tonumber(l_5_88[4]) == 1
              elseif #l_5_88 == 5 then
                l_5_28 = l_5_88[1]
                l_5_75 = l_5_88[2]
                l_5_76 = tonumber(l_5_88[3]) or 0
                l_5_77 = tonumber(l_5_88[4]) == 1
                l_5_78 = tonumber(l_5_88[5]) == 1
              else
                l_5_28 = l_5_88[1]
              end
              if l_5_28 ~= nil then
                local l_5_89 = #l_5_28 + 2
                -- DECOMPILER ERROR at PC556: Confused about usage of register: R32 in 'UnsetPending'

                ;
                (l_5_9.FolderEnumeration)[l_5_28] = {}
                -- DECOMPILER ERROR at PC560: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_5_9.FolderEnumeration)[l_5_28]).Files = {}
                -- DECOMPILER ERROR at PC564: Confused about usage of register: R32 in 'UnsetPending'

                ;
                ((l_5_9.FolderEnumeration)[l_5_28]).Subfolders = {}
                local l_5_90 = (sysio.FindFiles)(l_5_28, l_5_75, l_5_76)
                local l_5_91 = (sysio.FindFolders)(l_5_28, "*", 0)
                if l_5_90 ~= nil then
                  local l_5_92 = 0
                  for R38_PC421,l_5_97 in pairs(l_5_90) do
                    l_5_92 = l_5_92 + 1
                    -- DECOMPILER ERROR at PC589: Confused about usage of register: R40 in 'UnsetPending'

                    if l_5_27 < l_5_92 then
                      ((l_5_9.FolderEnumeration)[l_5_28]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC593: Confused about usage of register: R40 in 'UnsetPending'

                      ;
                      ((l_5_9.FolderEnumeration)[l_5_28]).TotalFilesEnumerated = #l_5_90
                      break
                    end
                    local l_5_98 = (string.sub)(l_5_97, l_5_89)
                    if l_5_78 then
                      local l_5_99 = (sysio.GetFileSize)(l_5_97)
                      local l_5_100 = (sysio.GetFileLastWriteTime)(l_5_97)
                      local l_5_101 = table.insert
                      local l_5_102 = ((l_5_9.FolderEnumeration)[l_5_28]).Files
                      local l_5_103 = {}
                      l_5_103.Name = l_5_98
                      l_5_103.Size = l_5_99
                      l_5_103.LastModified = l_5_100
                      l_5_101(l_5_102, l_5_103)
                      l_5_92 = l_5_92 + 1
                    end
                    if l_5_77 then
                      local l_5_104 = l_5_8
                      local l_5_105 = (MpCommon.AtomicCounterAddNamespaced)(l_5_3, l_5_2, 1)
                      -- DECOMPILER ERROR at PC634: Confused about usage of register: R43 in 'UnsetPending'

                      if l_5_104 <= l_5_105 then
                        ((l_5_9.FolderEnumeration)[l_5_28]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_5_2, (string.lower)(l_5_97), 1, l_5_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_5_97), 0, 5000)
                      end
                    end
                  end
                end
                l_5_92 = table
                l_5_92 = l_5_92.insert
                local l_5_106 = nil
                l_5_106 = l_5_9.Processed
                local l_5_107 = nil
                local l_5_108 = nil
                l_5_92(l_5_106, l_5_107)
                l_5_107 = {enumeratefolder = l_5_28}
                l_5_92 = sysio
                l_5_92 = l_5_92.IsFolderExists
                l_5_106 = l_5_28
                l_5_92 = l_5_92(l_5_106)
                if l_5_92 then
                  l_5_106 = l_5_9.FolderEnumeration
                  l_5_106 = l_5_106[l_5_28]
                  l_5_106.Exists = true
                  l_5_106 = l_5_9.FolderEnumeration
                  l_5_106 = l_5_106[l_5_28]
                  l_5_107 = sysio
                  l_5_107 = l_5_107.IsPathAVExcluded
                  l_5_108 = l_5_28
                  l_5_107 = l_5_107(l_5_108, true)
                  l_5_106.Excluded = l_5_107
                else
                  l_5_106 = l_5_9.FolderEnumeration
                  l_5_106 = l_5_106[l_5_28]
                  l_5_106.Exists = false
                end
                if l_5_78 == false then
                  l_5_106 = #l_5_90
                  if l_5_106 <= l_5_27 then
                    l_5_106 = table
                    l_5_106 = l_5_106.insert
                    l_5_107 = l_5_9.FolderEnumeration
                    l_5_107 = l_5_107[l_5_28]
                    local l_5_109 = nil
                    l_5_106(l_5_107, l_5_108)
                    l_5_108 = {Files = l_5_90}
                  else
                    l_5_107 = 1
                    l_5_108 = l_5_27
                    for i = l_5_107, l_5_108 do
                      local l_5_112 = nil
                      l_5_112 = l_5_90[l_5_111]
                    end
                    local l_5_113 = nil
                    local l_5_114 = nil
                    local l_5_115 = nil
                    ;
                    (table.insert)((l_5_9.FolderEnumeration)[l_5_28], l_5_113)
                    l_5_113 = {Files = l_5_106}
                    -- DECOMPILER ERROR at PC718: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_5_9.FolderEnumeration)[l_5_28]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC722: Confused about usage of register: R36 in 'UnsetPending'

                    ;
                    ((l_5_9.FolderEnumeration)[l_5_28]).TotalFilesEnumerated = #l_5_90
                  end
                end
                -- DECOMPILER ERROR at PC725: Overwrote pending register: R35 in 'AssignReg'

                if l_5_91 ~= nil then
                  for l_5_119,l_5_120 in pairs(l_5_91) do
                    local l_5_119, l_5_120 = nil
                    -- DECOMPILER ERROR at PC730: Overwrote pending register: R35 in 'AssignReg'

                    if l_5_27 < l_5_106 then
                      break
                    end
                    l_5_119 = string
                    l_5_119 = l_5_119.sub
                    l_5_120 = l_5_118
                    l_5_119 = l_5_119(l_5_120, l_5_89)
                    local l_5_121 = nil
                    l_5_120 = table
                    l_5_120 = l_5_120.insert
                    l_5_121 = l_5_9.FolderEnumeration
                    l_5_121 = l_5_121[l_5_28]
                    l_5_121 = l_5_121.Subfolders
                    l_5_120(l_5_121, l_5_119)
                  end
                end
                -- DECOMPILER ERROR at PC748: Overwrote pending register: R35 in 'AssignReg'

                l_5_106("hmdprecisionpulseenumeratefolder", l_5_2, l_5_28, 1, l_5_6, 500, 1)
                -- DECOMPILER ERROR at PC757: Confused about usage of register R37 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_5_27 = l_5_18.enumerateregistrykey
          if l_5_27 then
            l_5_27 = ""
            l_5_28 = l_5_18.enumerateregistrykey
            l_5_75 = split
            l_5_76 = l_5_28
            l_5_77 = ","
            l_5_75 = l_5_75(l_5_76, l_5_77)
            local l_5_122 = nil
            l_5_76 = ipairs
            l_5_77 = l_5_75
            l_5_76 = l_5_76(l_5_77)
            for l_5_79,l_5_80 in l_5_76 do
              local l_5_123, l_5_124, l_5_125, l_5_126, l_5_127 = nil
              l_5_81 = string
              l_5_81 = l_5_81.lower
              l_5_81 = l_5_81((MpCommon.Base64Decode)(l_5_80))
              local l_5_128 = nil
              l_5_27 = l_5_81
              if l_5_27 ~= nil then
                local l_5_129 = nil
                -- DECOMPILER ERROR at PC788: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC792: Confused about usage of register: R25 in 'UnsetPending'

                -- DECOMPILER ERROR at PC796: Confused about usage of register: R25 in 'UnsetPending'

                local l_5_130 = nil
                local l_5_131 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_5_27)) ~= nil then
                  (table.insert)(((l_5_9.RegkeyEnumeration)[l_5_27]).Keys, l_5_87)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_5_27)) ~= nil then
                    for l_5_88,l_5_89 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_5_27))) do
                      local l_5_132, l_5_133, l_5_134, l_5_135, l_5_136 = nil
                      l_5_90 = sysio
                      l_5_90 = l_5_90.GetRegValueType
                      l_5_91 = (sysio.RegOpenKey)(l_5_27)
                      l_5_92 = l_5_89
                      l_5_90 = (l_5_90(l_5_91, l_5_92))
                      local l_5_137 = nil
                      l_5_91 = nil
                      local l_5_138 = nil
                      if l_5_90 == 1 then
                        l_5_92 = sysio
                        l_5_92 = l_5_92.GetRegValueAsString
                        -- DECOMPILER ERROR at PC830: Overwrote pending register: R35 in 'AssignReg'

                        l_5_92 = l_5_92(l_5_106, l_5_89)
                        l_5_91 = l_5_92 or "Value not set"
                        l_5_92 = l_5_9.RegkeyEnumeration
                        l_5_92 = l_5_92[l_5_27]
                        l_5_92 = l_5_92.Values
                        l_5_92[l_5_89], l_5_106 = l_5_106, {}
                        l_5_92 = table
                        l_5_92 = l_5_92.insert
                        l_5_106 = l_5_9.RegkeyEnumeration
                        l_5_106 = l_5_106[l_5_27]
                        l_5_106 = l_5_106.Values
                        l_5_106 = l_5_106[l_5_89]
                        l_5_92(l_5_106, (l_5_91) .. l_5_122)
                      elseif l_5_90 == 2 then
                        l_5_92 = sysio
                        l_5_92 = l_5_92.GetRegValueAsString
                        l_5_106 = (sysio.RegOpenKey)(l_5_27)
                        l_5_92 = l_5_92(l_5_106, l_5_89)
                        l_5_91 = l_5_92 or "Value not set"
                        l_5_92 = l_5_9.RegkeyEnumeration
                        l_5_92 = l_5_92[l_5_27]
                        l_5_92 = l_5_92.Values
                        l_5_92[l_5_89], l_5_106 = l_5_106, {}
                        l_5_92 = table
                        l_5_92 = l_5_92.insert
                        l_5_106 = l_5_9.RegkeyEnumeration
                        l_5_106 = l_5_106[l_5_27]
                        l_5_106 = l_5_106.Values
                        l_5_106 = l_5_106[l_5_89]
                        -- DECOMPILER ERROR at PC874: Overwrote pending register: R37 in 'AssignReg'

                        l_5_92(l_5_106, (l_5_91) .. l_5_122)
                      elseif l_5_90 == 3 then
                        l_5_92 = sysio
                        l_5_92 = l_5_92.GetRegValueAsBinary
                        l_5_106 = (sysio.RegOpenKey)(l_5_27)
                        l_5_92 = l_5_92(l_5_106, l_5_89)
                        l_5_91 = l_5_92 or "Value not set"
                        l_5_92 = l_5_9.RegkeyEnumeration
                        l_5_92 = l_5_92[l_5_27]
                        l_5_92 = l_5_92.Values
                        l_5_92[l_5_89], l_5_106 = l_5_106, {}
                        l_5_92 = table
                        l_5_92 = l_5_92.insert
                        l_5_106 = l_5_9.RegkeyEnumeration
                        l_5_106 = l_5_106[l_5_27]
                        l_5_106 = l_5_106.Values
                        l_5_106 = l_5_106[l_5_89]
                        -- DECOMPILER ERROR at PC900: Overwrote pending register: R37 in 'AssignReg'

                        l_5_92(l_5_106, (l_5_91) .. l_5_122)
                      elseif l_5_90 == 4 then
                        l_5_92 = sysio
                        l_5_92 = l_5_92.GetRegValueAsDword
                        l_5_106 = (sysio.RegOpenKey)(l_5_27)
                        l_5_92 = l_5_92(l_5_106, l_5_89)
                        l_5_91 = l_5_92 or "Value not set"
                        l_5_92 = l_5_9.RegkeyEnumeration
                        l_5_92 = l_5_92[l_5_27]
                        l_5_92 = l_5_92.Values
                        l_5_92[l_5_89], l_5_106 = l_5_106, {}
                        l_5_92 = table
                        l_5_92 = l_5_92.insert
                        l_5_106 = l_5_9.RegkeyEnumeration
                        l_5_106 = l_5_106[l_5_27]
                        l_5_106 = l_5_106.Values
                        l_5_106 = l_5_106[l_5_89]
                        -- DECOMPILER ERROR at PC926: Overwrote pending register: R37 in 'AssignReg'

                        l_5_92(l_5_106, (l_5_91) .. l_5_122)
                      elseif l_5_90 == 7 then
                        l_5_92 = sysio
                        l_5_92 = l_5_92.GetRegValueAsMultiString
                        l_5_106 = (sysio.RegOpenKey)(l_5_27)
                        l_5_92 = l_5_92(l_5_106, l_5_89)
                        l_5_91 = l_5_92 or "Value not set"
                        l_5_92 = l_5_9.RegkeyEnumeration
                        l_5_92 = l_5_92[l_5_27]
                        l_5_92 = l_5_92.Values
                        l_5_92[l_5_89], l_5_106 = l_5_106, {}
                        l_5_92 = ipairs
                        l_5_106 = l_5_91
                        l_5_92 = l_5_92(l_5_106)
                        for l_5_122,l_5_123 in l_5_92 do
                          local l_5_139, l_5_140, l_5_141, l_5_142, l_5_143 = nil
                          l_5_124 = table
                          l_5_124 = l_5_124.insert
                          l_5_125 = l_5_9.RegkeyEnumeration
                          l_5_125 = l_5_125[l_5_27]
                          l_5_125 = l_5_125.Values
                          l_5_125 = l_5_125[l_5_89]
                          l_5_126 = l_5_123
                          l_5_127 = " (REG_MULTI_SZ)"
                          l_5_126 = l_5_126 .. l_5_127
                          l_5_124(l_5_125, l_5_126)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_5_27), l_5_89) then
                          l_5_91 = l_5_90 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC976: Confused about usage of register: R34 in 'UnsetPending'

                        ;
                        (((l_5_9.RegkeyEnumeration)[l_5_27]).Values)[l_5_89] = {}
                        -- DECOMPILER ERROR at PC984: Overwrote pending register: R37 in 'AssignReg'

                        ;
                        (table.insert)((((l_5_9.RegkeyEnumeration)[l_5_27]).Values)[l_5_89], (l_5_91) .. l_5_122)
                      end
                      l_5_91 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_5_27), l_5_89) or "Value not set"
                      -- DECOMPILER ERROR at PC1000: Confused about usage of register: R34 in 'UnsetPending'

                      ;
                      (((l_5_9.RegkeyEnumeration)[l_5_27]).Values)[l_5_89] = {}
                      ;
                      (table.insert)((((l_5_9.RegkeyEnumeration)[l_5_27]).Values)[l_5_89], (l_5_91) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_5_144 = nil
                local l_5_145 = nil
                local l_5_146 = nil
                ;
                (table.insert)(l_5_9.Processed, {enumerateregistrykey = l_5_27})
              end
            end
            -- DECOMPILER ERROR at PC1021: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          end
          l_5_27 = l_5_18.deleteregistryvalue
          if l_5_27 then
            l_5_27 = ""
            l_5_28 = l_5_18.deleteregistryvalue
            l_5_75 = split
            l_5_75 = l_5_75(l_5_28, ",")
            local l_5_147 = nil
            for l_5_151,l_5_152 in ipairs(l_5_75) do
              local l_5_148, l_5_149, l_5_150, l_5_151, l_5_152 = nil
              l_5_81 = string
              l_5_81 = l_5_81.lower
              -- DECOMPILER ERROR at PC1038: Confused about usage of register: R22 in 'UnsetPending'

              l_5_81 = l_5_81((MpCommon.Base64Decode)(l_5_80))
              local l_5_153 = nil
              if l_5_27 ~= nil then
                l_5_27 = explode(l_5_81, "|")
                if #l_5_27 == 2 then
                  local l_5_154 = nil
                  local l_5_155 = nil
                  -- DECOMPILER ERROR at PC1055: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1058: Confused about usage of register: R24 in 'UnsetPending'

                  local l_5_156 = nil
                  if (sysio.RegOpenKey)(l_5_27[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1069: Confused about usage of register: R24 in 'UnsetPending'

                    local l_5_157 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_5_2, (string.format)("%s\\\\%s", l_5_27[1], l_5_27[2]), l_5_90, l_5_91, 500, 1)
                    -- DECOMPILER ERROR at PC1086: Overwrote pending register: R32 in 'AssignReg'

                    local l_5_158, l_5_159 = nil
                    -- DECOMPILER ERROR at PC1091: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1091: Overwrote pending register: R32 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_5_90)
                    -- DECOMPILER ERROR at PC1095: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1096: Overwrote pending register: R33 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_5_90, l_5_91, 1, l_5_6, 500, 1)
                    -- DECOMPILER ERROR at PC1105: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1106: Overwrote pending register: R33 in 'AssignReg'

                    local l_5_160, l_5_161 = nil
                    -- DECOMPILER ERROR at PC1109: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1110: Overwrote pending register: R32 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1111: Overwrote pending register: R33 in 'AssignReg'

                    l_5_90(l_5_91, (string.format)("%s\\\\%s", l_5_27[1], l_5_27[2]))
                  else
                    -- DECOMPILER ERROR at PC1116: Confused about usage of register: R24 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1116: Confused about usage of register: R27 in 'UnsetPending'

                  end
                  local l_5_162 = nil
                  -- DECOMPILER ERROR at PC1119: Overwrote pending register: R28 in 'AssignReg'

                  local l_5_163 = nil
                  local l_5_164 = nil
                  -- DECOMPILER ERROR at PC1121: Confused about usage of register: R24 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1121: Overwrote pending register: R30 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1123: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1123: Overwrote pending register: R32 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_5_2, l_5_90), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_5_90, l_5_91, (string.format)("%s\\\\%s", l_5_27[1], l_5_27[2])) .. " " .. l_5_90})
                end
              end
            end
          end
          l_5_27 = l_5_18.process
          if l_5_27 then
            l_5_27 = mp
            l_5_27 = l_5_27.get_contextdata
            l_5_28 = mp
            l_5_28 = l_5_28.CONTEXT_DATA_PROCESS_PPID
            l_5_27 = l_5_27(l_5_28)
            if l_5_27 == nil then
              l_5_28 = MpCommon
              l_5_28 = l_5_28.ExpandEnvironmentVariables
              l_5_75 = "%windir%"
              l_5_28 = l_5_28(l_5_75)
              l_5_75 = l_5_28
              l_5_75 = l_5_75 .. "\\system32\\"
              local l_5_165 = nil
              local l_5_166 = nil
              if #(sysio.GetProcessFromFileName)(l_5_75 .. "services.exe") > 0 then
                l_5_27 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_5_75 .. "services.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_5_75 .. "services.exe"))[1]).starttime)
              end
            end
            l_5_28 = table
            l_5_28 = l_5_28.insert
            l_5_75 = l_5_9.Processed
            local l_5_167 = nil
            local l_5_168 = nil
            l_5_28(l_5_75, {process = l_5_18.process})
            l_5_28 = MpCommon
            l_5_28 = l_5_28.BmTriggerSig
            l_5_75 = l_5_27
            l_5_28(l_5_75, "Heimdall_ProcessDispatch", l_5_18.process)
          end
          l_5_27 = l_5_18.firewall
          if l_5_27 then
            l_5_27 = l_5_18.firewall
            l_5_28 = split
            l_5_75 = l_5_27
            l_5_28 = l_5_28(l_5_75, ",")
            l_5_75 = ipairs
            l_5_75 = l_5_75(l_5_28)
            for l_5_172,l_5_173 in l_5_75 do
              local l_5_169, l_5_170, l_5_171, l_5_172, l_5_173 = nil
              -- DECOMPILER ERROR at PC1191: Confused about usage of register: R21 in 'UnsetPending'

              local l_5_174 = nil
              -- DECOMPILER ERROR at PC1195: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1196: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_5_81) then
                local l_5_175 = nil
                local l_5_176 = nil
                local l_5_177 = nil
                l_5_81(l_5_9.Processed, {firewall = (MpCommon.Base64Decode)(l_5_81)})
                -- DECOMPILER ERROR at PC1201: Overwrote pending register: R23 in 'AssignReg'

                l_5_81 = l_5_81((MpCommon.Base64Decode)(l_5_81), "_")
                l_5_81 = #l_5_81
                if l_5_81 == 3 then
                  l_5_81 = tonumber
                  -- DECOMPILER ERROR at PC1210: Confused about usage of register: R22 in 'UnsetPending'

                  l_5_81 = l_5_81(l_5_81[2])
                  -- DECOMPILER ERROR at PC1214: Confused about usage of register: R22 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1216: Confused about usage of register: R22 in 'UnsetPending'

                  local l_5_178 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_5_81[1], tonumber(l_5_81[3]), (mp.bitand)(l_5_81, 2) == 2, (mp.bitand)(l_5_81, 1) == 1)
                end
              end
            end
          end
          l_5_27 = l_5_18.sinkholedns
          if l_5_27 then
            l_5_27 = l_5_18.sinkholedns
            l_5_28 = split
            l_5_28 = l_5_28(l_5_27, ",")
            for l_5_187,l_5_188 in ipairs(l_5_28) do
              local l_5_184, l_5_185, l_5_186, l_5_187, l_5_188 = nil
              -- DECOMPILER ERROR at PC1253: Confused about usage of register: R21 in 'UnsetPending'

              local l_5_189 = nil
              -- DECOMPILER ERROR at PC1255: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1256: Overwrote pending register: R23 in 'AssignReg'

              local l_5_190 = nil
              local l_5_191 = nil
              local l_5_192 = nil
              l_5_81(l_5_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_5_81)})
              -- DECOMPILER ERROR at PC1263: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_5_81) then
                l_5_81 = l_5_81((MpCommon.Base64Decode)(l_5_81), "_")
                -- DECOMPILER ERROR at PC1269: Overwrote pending register: R23 in 'AssignReg'

                -- DECOMPILER ERROR at PC1272: Confused about usage of register: R22 in 'UnsetPending'

                l_5_81 = l_5_81(l_5_81[1], tonumber(l_5_81[2]))
                -- DECOMPILER ERROR at PC1277: Confused about usage of register: R22 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1279: Confused about usage of register: R22 in 'UnsetPending'

                local l_5_193 = nil
                l_5_9["sinkholedns" .. "_" .. l_5_81[1] .. "_" .. l_5_81[2]] = {res = l_5_81, isAllowed = l_5_81[1]}
              end
            end
          end
          l_5_27 = l_5_18.dnscache
          if l_5_27 then
            l_5_27 = l_5_18.dnscache
            l_5_28 = split
            l_5_28 = l_5_28(l_5_27, ",")
            for l_5_197,l_5_198 in ipairs(l_5_28) do
              local l_5_194, l_5_195, l_5_196, l_5_197, l_5_198 = nil
              -- DECOMPILER ERROR at PC1301: Confused about usage of register: R21 in 'UnsetPending'

              local l_5_199 = nil
              -- DECOMPILER ERROR at PC1303: Overwrote pending register: R23 in 'AssignReg'

              -- DECOMPILER ERROR at PC1304: Overwrote pending register: R23 in 'AssignReg'

              local l_5_200 = nil
              local l_5_201 = nil
              local l_5_202 = nil
              l_5_81(l_5_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_5_81)})
              -- DECOMPILER ERROR at PC1311: Overwrote pending register: R23 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_5_81) then
                l_5_81 = l_5_81((MpCommon.Base64Decode)(l_5_81), "_")
                for i_1,i_2 in ipairs(l_5_81) do
                  local l_5_203, l_5_204, l_5_205 = nil
                  l_5_9["dnscache" .. "_" .. i_2], l_5_81 = l_5_81, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_5_27 = l_5_18.debug
          if l_5_27 then
            l_5_27 = l_5_18.debug
            l_5_28 = split
            l_5_28 = l_5_28(l_5_27, ",")
            local l_5_206 = nil
            for l_5_210,l_5_211 in ipairs(l_5_28) do
              local l_5_207, l_5_208, l_5_209, l_5_210, l_5_211 = nil
              l_5_81 = MpCommon
              l_5_81 = l_5_81.Base64Decode
              -- DECOMPILER ERROR at PC1350: Confused about usage of register: R22 in 'UnsetPending'

              l_5_81 = l_5_81(l_5_81)
              local l_5_212 = nil
              local l_5_213 = nil
              local l_5_214 = nil
              local l_5_215 = nil
              ;
              (table.insert)(l_5_9.Processed, {debug = l_5_81})
              for l_5_219,l_5_220 in ipairs((split(l_5_81, "_"))) do
                local l_5_216, l_5_217, l_5_218, l_5_219, l_5_220 = nil
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
                  local l_5_221 = nil
                  -- DECOMPILER ERROR at PC1380: Overwrote pending register: R33 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1384: Confused about usage of register: R26 in 'UnsetPending'

                  l_5_91 = l_5_91(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1389: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1391: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1391: Overwrote pending register: R32 in 'AssignReg'

                  if nil == "PCNP" then
                    l_5_91 = ":"
                    -- DECOMPILER ERROR at PC1393: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1394: Overwrote pending register: R32 in 'AssignReg'

                    local l_5_222 = nil
                    l_5_91 = table_pack
                    -- DECOMPILER ERROR at PC1399: Confused about usage of register: R26 in 'UnsetPending'

                    l_5_91 = l_5_91(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1404: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1406: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1406: Overwrote pending register: R32 in 'AssignReg'

                    if nil == "RQ" then
                      l_5_91 = ":"
                      -- DECOMPILER ERROR at PC1408: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1409: Overwrote pending register: R32 in 'AssignReg'

                      local l_5_223 = nil
                      l_5_91 = table_pack
                      -- DECOMPILER ERROR at PC1414: Confused about usage of register: R26 in 'UnsetPending'

                      l_5_91 = l_5_91(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1419: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1421: Confused about usage of register: R25 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1421: Overwrote pending register: R32 in 'AssignReg'

                      if nil == "AC" then
                        l_5_91 = ":"
                        -- DECOMPILER ERROR at PC1423: Confused about usage of register: R26 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1424: Overwrote pending register: R32 in 'AssignReg'

                        local l_5_224 = nil
                        l_5_91 = table_pack
                        -- DECOMPILER ERROR at PC1429: Confused about usage of register: R26 in 'UnsetPending'

                        l_5_91 = l_5_91(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_5_9.debug = {[l_5_90] = l_5_91, [l_5_90] = l_5_91, [l_5_90] = l_5_91, [l_5_90] = l_5_91}
          end
          l_5_27 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_5_10.report = safeJsonSerialize(l_5_9, 260)
          l_5_10.TAG = "NOLOOKUP"
          SafeGetUrlReputation(l_5_28, l_5_10, false, 2000)
          -- DECOMPILER ERROR at PC1453: Confused about usage of register R37 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


