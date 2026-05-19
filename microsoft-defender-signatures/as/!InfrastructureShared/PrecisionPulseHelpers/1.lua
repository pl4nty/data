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
    local l_1_4 = nil
    for l_1_8,l_1_9 in pairs((sysio.FindFiles)(l_1_1 .. "\\Microsoft\\Windows Defender\\Support", "*", 1)) do
      local l_1_5 = nil
      -- DECOMPILER ERROR at PC22: Confused about usage of register: R8 in 'UnsetPending'

      if (string.find)(R8_PC22, "MpWppTracing", 1, true) or (string.find)(R8_PC22, "MPScanSkip", 1, true) or (string.find)(R8_PC22, "MPLog", 1, true) then
        local l_1_11 = (MpCommon.GetCurrentTimeT)()
        local l_1_12 = (sysio.GetFileSize)(l_1_10)
        local l_1_13 = (sysio.GetFileLastWriteTime)(l_1_10)
        local l_1_14 = {ReadTimeStamp = l_1_11, tracking_id = l_1_0, Size = l_1_12, LastModified = l_1_13}
        local l_1_15 = (sysio.ReadFile)(l_1_10, 0, l_1_12)
        if ((sysio.GetLastResult)()).Success then
          l_1_15 = (MpCommon.GzipCompress)(l_1_15)
          l_1_15 = (MpCommon.Base64Encode)(l_1_15)
          ReportResource(l_1_10, l_1_15, l_1_14, "LUA")
        else
          l_1_14.Facility = ((sysio.GetLastResult)()).Facility
          l_1_14.Code = ((sysio.GetLastResult)()).Code
          ReportResource(l_1_10, "NULL", l_1_14, "LUA")
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

        -- DECOMPILER ERROR at PC91: Overwrote pending register: R4 in 'AssignReg'

        if l_2_5 >= l_2_1 or l_2_6 then
          local l_2_15 = nil
          local l_2_16 = l_2_6
          return l_2_16, {Sha1 = l_2_12, Sha256 = l_2_13, PartialSha1 = l_2_14, PartialSha256 = l_2_15, ReadTimeStamp = l_2_7}
        end
        do
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
                else
                  do
                    if l_6_48 then
                      local l_6_60 = (sysio.GetFileSize)(l_6_47)
                      local l_6_61 = (sysio.GetFileLastWriteTime)(l_6_47)
                      -- DECOMPILER ERROR at PC387: Confused about usage of register: R30 in 'UnsetPending'

                      ;
                      ((l_6_9.FullFilePathScan)[l_6_47]).ExcludedFileInfo = {}
                      local l_6_62 = table.insert
                      local l_6_63 = ((l_6_9.FullFilePathScan)[l_6_47]).ExcludedFileInfo
                      local l_6_64 = {}
                      l_6_64.Size = l_6_60
                      l_6_64.LastModified = l_6_61
                      l_6_62(l_6_63, l_6_64)
                      l_6_62 = pcall
                      l_6_63 = CollectFile
                      l_6_64 = l_6_47
                      l_6_62 = l_6_62(l_6_63, l_6_64, l_6_60, true)
                      if l_6_62 and l_6_64 then
                        l_6_64.tracking_id = l_6_7
                        -- DECOMPILER ERROR at PC410: Confused about usage of register: R33 in 'UnsetPending'

                        ;
                        ((l_6_9.FullFilePathScan)[l_6_47]).FileRead_Info = l_6_64
                        if l_6_63 then
                          pcall(ReportResource, l_6_47, R36_PC420, (l_6_9.FullFilePathScan)[l_6_47], "LUA")
                        end
                      end
                    end
                    do
                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out IF_ELSE_STMT

                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out IF_STMT

                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out DO_STMT

                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out IF_THEN_STMT

                      -- DECOMPILER ERROR at PC421: LeaveBlock: unexpected jumping out IF_STMT

                    end
                  end
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
        for l_6_68,l_6_69 in ipairs(l_6_30) do
          local l_6_70 = (string.lower)((MpCommon.Base64Decode)(l_6_69))
          local l_6_71 = table.insert
          local l_6_72 = l_6_9.Processed
          local l_6_73 = {}
          l_6_73.scanfile = l_6_70
          l_6_71(l_6_72, l_6_73)
          l_6_71 = AppendToRollingQueueNamespaced
          l_6_72 = "hmdprecisionpulsescanfile"
          l_6_73 = l_6_2
          l_6_71(l_6_72, l_6_73, l_6_70, 1, l_6_6, 500, 1)
        end
      end
      do
        do
          l_6_29 = l_6_20.enumeratefolder
          if l_6_29 then
            l_6_29 = 260
            l_6_30 = ""
            local l_6_74 = "*"
            local l_6_75 = 0
            local l_6_76 = true
            local l_6_77 = false
            local l_6_78 = l_6_20.enumeratefolder
            local l_6_79 = split(l_6_78, ",")
            local l_6_80 = 0
            for l_6_84,l_6_85 in ipairs(l_6_79) do
              l_6_80 = l_6_80 + 1
              -- DECOMPILER ERROR at PC483: Confused about usage of register: R30 in 'UnsetPending'

              if l_6_29 < l_6_80 then
                ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxFoldersEnumerated = true
                break
              end
              local l_6_86 = (string.lower)((MpCommon.Base64Decode)(l_6_85))
              local l_6_87 = explode(l_6_86, "|")
              if #l_6_87 == 4 then
                l_6_30 = l_6_87[1]
                l_6_74 = l_6_87[2]
                l_6_75 = tonumber(l_6_87[3]) or 0
                l_6_76 = tonumber(l_6_87[4]) == 1
              elseif #l_6_87 == 5 then
                l_6_30 = l_6_87[1]
                l_6_74 = l_6_87[2]
                l_6_75 = tonumber(l_6_87[3]) or 0
                l_6_76 = tonumber(l_6_87[4]) == 1
                l_6_77 = tonumber(l_6_87[5]) == 1
              else
                l_6_30 = l_6_87[1]
              end
              if l_6_30 ~= nil then
                local l_6_88 = #l_6_30 + 2
                -- DECOMPILER ERROR at PC548: Confused about usage of register: R33 in 'UnsetPending'

                ;
                (l_6_9.FolderEnumeration)[l_6_30] = {}
                -- DECOMPILER ERROR at PC552: Confused about usage of register: R33 in 'UnsetPending'

                ;
                ((l_6_9.FolderEnumeration)[l_6_30]).Files = {}
                -- DECOMPILER ERROR at PC556: Confused about usage of register: R33 in 'UnsetPending'

                ;
                ((l_6_9.FolderEnumeration)[l_6_30]).Subfolders = {}
                local l_6_89 = (sysio.FindFiles)(l_6_30, l_6_74, R36_PC420)
                -- DECOMPILER ERROR at PC566: Overwrote pending register: R36 in 'AssignReg'

                local l_6_90 = (sysio.FindFolders)(l_6_30, R36_PC420, 0)
                if l_6_89 ~= nil then
                  local l_6_91 = 0
                  -- DECOMPILER ERROR at PC572: Overwrote pending register: R36 in 'AssignReg'

                  R36_PC420 = R36_PC420(l_6_89)
                  for l_6_95,l_6_96 in R36_PC420 do
                    l_6_91 = l_6_91 + 1
                    -- DECOMPILER ERROR at PC581: Confused about usage of register: R41 in 'UnsetPending'

                    if l_6_29 < l_6_91 then
                      ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxFilesReported = true
                      -- DECOMPILER ERROR at PC585: Confused about usage of register: R41 in 'UnsetPending'

                      ;
                      ((l_6_9.FolderEnumeration)[l_6_30]).TotalFilesEnumerated = #l_6_89
                      break
                    end
                    local l_6_97 = (string.sub)(l_6_96, l_6_88)
                    if l_6_77 then
                      local l_6_98 = (sysio.GetFileSize)(l_6_96)
                      local l_6_99 = (sysio.GetFileLastWriteTime)(l_6_96)
                      local l_6_100 = table.insert
                      local l_6_101 = ((l_6_9.FolderEnumeration)[l_6_30]).Files
                      local l_6_102 = {}
                      l_6_102.Name = l_6_97
                      l_6_102.Size = l_6_98
                      l_6_102.LastModified = l_6_99
                      l_6_100(l_6_101, l_6_102)
                      l_6_91 = l_6_91 + 1
                    end
                    if l_6_76 then
                      local l_6_103 = l_6_8
                      local l_6_104 = (MpCommon.AtomicCounterAddNamespaced)(l_6_3, l_6_2, 1)
                      -- DECOMPILER ERROR at PC626: Confused about usage of register: R44 in 'UnsetPending'

                      if l_6_103 <= l_6_104 then
                        ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxScanCounter = true
                        break
                      else
                        AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", l_6_2, (string.lower)(l_6_96), 1, l_6_6, 500, 1)
                        ;
                        (mp.TriggerScanResource)("file", (string.lower)(l_6_96), 0, 5000)
                      end
                    end
                  end
                end
                l_6_91 = table
                l_6_91 = l_6_91.insert
                local l_6_105 = nil
                l_6_105 = l_6_9.Processed
                local l_6_106 = nil
                local l_6_107 = nil
                l_6_91(l_6_105, l_6_106)
                l_6_106 = {enumeratefolder = l_6_30}
                l_6_91 = sysio
                l_6_91 = l_6_91.IsFolderExists
                l_6_105 = l_6_30
                l_6_91 = l_6_91(l_6_105)
                if l_6_91 then
                  l_6_105 = l_6_9.FolderEnumeration
                  l_6_105 = l_6_105[l_6_30]
                  l_6_105.Exists = true
                  l_6_105 = l_6_9.FolderEnumeration
                  l_6_105 = l_6_105[l_6_30]
                  l_6_106 = sysio
                  l_6_106 = l_6_106.IsPathAVExcluded
                  l_6_107 = l_6_30
                  l_6_106 = l_6_106(l_6_107, true)
                  l_6_105.Excluded = l_6_106
                else
                  l_6_105 = l_6_9.FolderEnumeration
                  l_6_105 = l_6_105[l_6_30]
                  l_6_105.Exists = false
                end
                if l_6_77 == false then
                  l_6_105 = #l_6_89
                  if l_6_105 <= l_6_29 then
                    l_6_105 = table
                    l_6_105 = l_6_105.insert
                    l_6_106 = l_6_9.FolderEnumeration
                    l_6_106 = l_6_106[l_6_30]
                    local l_6_108 = nil
                    l_6_105(l_6_106, l_6_107)
                    l_6_107 = {Files = l_6_89}
                  else
                    l_6_106 = 1
                    l_6_107 = l_6_29
                    for i = l_6_106, l_6_107 do
                      local l_6_111 = nil
                      l_6_111 = l_6_89[l_6_110]
                    end
                    local l_6_112 = nil
                    local l_6_113 = nil
                    local l_6_114 = nil
                    ;
                    (table.insert)((l_6_9.FolderEnumeration)[l_6_30], l_6_112)
                    l_6_112 = {Files = l_6_105}
                    -- DECOMPILER ERROR at PC710: Confused about usage of register: R37 in 'UnsetPending'

                    ;
                    ((l_6_9.FolderEnumeration)[l_6_30]).ExceededMaxFilesReported = true
                    -- DECOMPILER ERROR at PC714: Confused about usage of register: R37 in 'UnsetPending'

                    ;
                    ((l_6_9.FolderEnumeration)[l_6_30]).TotalFilesEnumerated = #l_6_89
                  end
                end
                -- DECOMPILER ERROR at PC717: Overwrote pending register: R36 in 'AssignReg'

                if l_6_90 ~= nil then
                  for l_6_118,l_6_119 in pairs(l_6_90) do
                    local l_6_118, l_6_119 = nil
                    -- DECOMPILER ERROR at PC722: Overwrote pending register: R36 in 'AssignReg'

                    if l_6_29 < l_6_105 then
                      break
                    end
                    l_6_118 = string
                    l_6_118 = l_6_118.sub
                    l_6_119 = l_6_117
                    l_6_118 = l_6_118(l_6_119, l_6_88)
                    local l_6_120 = nil
                    l_6_119 = table
                    l_6_119 = l_6_119.insert
                    l_6_120 = l_6_9.FolderEnumeration
                    l_6_120 = l_6_120[l_6_30]
                    l_6_120 = l_6_120.Subfolders
                    l_6_119(l_6_120, l_6_118)
                  end
                end
                -- DECOMPILER ERROR at PC740: Overwrote pending register: R36 in 'AssignReg'

                l_6_105("hmdprecisionpulseenumeratefolder", l_6_2, l_6_30, 1, l_6_6, 500, 1)
                -- DECOMPILER ERROR at PC749: Confused about usage of register R38 for local variables in 'ReleaseLocals'

              end
            end
          end
          l_6_29 = l_6_20.enumerateregistrykey
          if l_6_29 then
            l_6_29 = ""
            l_6_30 = l_6_20.enumerateregistrykey
            l_6_74 = split
            l_6_75 = l_6_30
            l_6_76 = ","
            l_6_74 = l_6_74(l_6_75, l_6_76)
            local l_6_121 = nil
            l_6_75 = ipairs
            l_6_76 = l_6_74
            l_6_75 = l_6_75(l_6_76)
            for l_6_78,l_6_79 in l_6_75 do
              local l_6_122, l_6_123, l_6_124, l_6_125, l_6_126 = nil
              l_6_80 = string
              l_6_80 = l_6_80.lower
              l_6_80 = l_6_80((MpCommon.Base64Decode)(l_6_79))
              local l_6_127 = nil
              l_6_29 = l_6_80
              if l_6_29 ~= nil then
                local l_6_128 = nil
                -- DECOMPILER ERROR at PC780: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC784: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC788: Confused about usage of register: R26 in 'UnsetPending'

                local l_6_129 = nil
                local l_6_130 = nil
                if (sysio.RegEnumKeys)((sysio.RegOpenKey)(l_6_29)) ~= nil then
                  (table.insert)(((l_6_9.RegkeyEnumeration)[l_6_29]).Keys, l_6_86)
                  if (sysio.RegEnumValues)((sysio.RegOpenKey)(l_6_29)) ~= nil then
                    for l_6_87,l_6_88 in pairs((sysio.RegEnumValues)((sysio.RegOpenKey)(l_6_29))) do
                      local l_6_131, l_6_132, l_6_133, l_6_134, l_6_135 = nil
                      l_6_89 = sysio
                      l_6_89 = l_6_89.GetRegValueType
                      l_6_90 = (sysio.RegOpenKey)(l_6_29)
                      l_6_91 = l_6_88
                      l_6_89 = (l_6_89(l_6_90, l_6_91))
                      local l_6_136 = nil
                      l_6_90 = nil
                      local l_6_137 = nil
                      if l_6_89 == 1 then
                        l_6_91 = sysio
                        l_6_91 = l_6_91.GetRegValueAsString
                        -- DECOMPILER ERROR at PC822: Overwrote pending register: R36 in 'AssignReg'

                        l_6_91 = l_6_91(l_6_105, l_6_88)
                        l_6_90 = l_6_91 or "Value not set"
                        l_6_91 = l_6_9.RegkeyEnumeration
                        l_6_91 = l_6_91[l_6_29]
                        l_6_91 = l_6_91.Values
                        l_6_91[l_6_88], l_6_105 = l_6_105, {}
                        l_6_91 = table
                        l_6_91 = l_6_91.insert
                        l_6_105 = l_6_9.RegkeyEnumeration
                        l_6_105 = l_6_105[l_6_29]
                        l_6_105 = l_6_105.Values
                        l_6_105 = l_6_105[l_6_88]
                        l_6_91(l_6_105, (l_6_90) .. l_6_121)
                      elseif l_6_89 == 2 then
                        l_6_91 = sysio
                        l_6_91 = l_6_91.GetRegValueAsString
                        l_6_105 = (sysio.RegOpenKey)(l_6_29)
                        l_6_91 = l_6_91(l_6_105, l_6_88)
                        l_6_90 = l_6_91 or "Value not set"
                        l_6_91 = l_6_9.RegkeyEnumeration
                        l_6_91 = l_6_91[l_6_29]
                        l_6_91 = l_6_91.Values
                        l_6_91[l_6_88], l_6_105 = l_6_105, {}
                        l_6_91 = table
                        l_6_91 = l_6_91.insert
                        l_6_105 = l_6_9.RegkeyEnumeration
                        l_6_105 = l_6_105[l_6_29]
                        l_6_105 = l_6_105.Values
                        l_6_105 = l_6_105[l_6_88]
                        -- DECOMPILER ERROR at PC866: Overwrote pending register: R38 in 'AssignReg'

                        l_6_91(l_6_105, (l_6_90) .. l_6_121)
                      elseif l_6_89 == 3 then
                        l_6_91 = sysio
                        l_6_91 = l_6_91.GetRegValueAsBinary
                        l_6_105 = (sysio.RegOpenKey)(l_6_29)
                        l_6_91 = l_6_91(l_6_105, l_6_88)
                        l_6_90 = l_6_91 or "Value not set"
                        l_6_91 = l_6_9.RegkeyEnumeration
                        l_6_91 = l_6_91[l_6_29]
                        l_6_91 = l_6_91.Values
                        l_6_91[l_6_88], l_6_105 = l_6_105, {}
                        l_6_91 = table
                        l_6_91 = l_6_91.insert
                        l_6_105 = l_6_9.RegkeyEnumeration
                        l_6_105 = l_6_105[l_6_29]
                        l_6_105 = l_6_105.Values
                        l_6_105 = l_6_105[l_6_88]
                        -- DECOMPILER ERROR at PC892: Overwrote pending register: R38 in 'AssignReg'

                        l_6_91(l_6_105, (l_6_90) .. l_6_121)
                      elseif l_6_89 == 4 then
                        l_6_91 = sysio
                        l_6_91 = l_6_91.GetRegValueAsDword
                        l_6_105 = (sysio.RegOpenKey)(l_6_29)
                        l_6_91 = l_6_91(l_6_105, l_6_88)
                        l_6_90 = l_6_91 or "Value not set"
                        l_6_91 = l_6_9.RegkeyEnumeration
                        l_6_91 = l_6_91[l_6_29]
                        l_6_91 = l_6_91.Values
                        l_6_91[l_6_88], l_6_105 = l_6_105, {}
                        l_6_91 = table
                        l_6_91 = l_6_91.insert
                        l_6_105 = l_6_9.RegkeyEnumeration
                        l_6_105 = l_6_105[l_6_29]
                        l_6_105 = l_6_105.Values
                        l_6_105 = l_6_105[l_6_88]
                        -- DECOMPILER ERROR at PC918: Overwrote pending register: R38 in 'AssignReg'

                        l_6_91(l_6_105, (l_6_90) .. l_6_121)
                      elseif l_6_89 == 7 then
                        l_6_91 = sysio
                        l_6_91 = l_6_91.GetRegValueAsMultiString
                        l_6_105 = (sysio.RegOpenKey)(l_6_29)
                        l_6_91 = l_6_91(l_6_105, l_6_88)
                        l_6_90 = l_6_91 or "Value not set"
                        l_6_91 = l_6_9.RegkeyEnumeration
                        l_6_91 = l_6_91[l_6_29]
                        l_6_91 = l_6_91.Values
                        l_6_91[l_6_88], l_6_105 = l_6_105, {}
                        l_6_91 = ipairs
                        l_6_105 = l_6_90
                        l_6_91 = l_6_91(l_6_105)
                        for l_6_121,l_6_122 in l_6_91 do
                          local l_6_138, l_6_139, l_6_140, l_6_141, l_6_142 = nil
                          l_6_123 = table
                          l_6_123 = l_6_123.insert
                          l_6_124 = l_6_9.RegkeyEnumeration
                          l_6_124 = l_6_124[l_6_29]
                          l_6_124 = l_6_124.Values
                          l_6_124 = l_6_124[l_6_88]
                          l_6_125 = l_6_122
                          l_6_126 = " (REG_MULTI_SZ)"
                          l_6_125 = l_6_125 .. l_6_126
                          l_6_123(l_6_124, l_6_125)
                        end
                      else
                        if not (sysio.GetRegValueAsQword)((sysio.RegOpenKey)(l_6_29), l_6_88) then
                          l_6_90 = l_6_89 ~= 11 or "Value not set"
                        end
                        -- DECOMPILER ERROR at PC968: Confused about usage of register: R35 in 'UnsetPending'

                        ;
                        (((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_88] = {}
                        -- DECOMPILER ERROR at PC976: Overwrote pending register: R38 in 'AssignReg'

                        ;
                        (table.insert)((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_88], (l_6_90) .. l_6_121)
                      end
                      l_6_90 = (sysio.GetRegValueAsString)((sysio.RegOpenKey)(l_6_29), l_6_88) or "Value not set"
                      -- DECOMPILER ERROR at PC992: Confused about usage of register: R35 in 'UnsetPending'

                      ;
                      (((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_88] = {}
                      ;
                      (table.insert)((((l_6_9.RegkeyEnumeration)[l_6_29]).Values)[l_6_88], (l_6_90) .. " (UNKNOWN TYPE)")
                    end
                  end
                end
                local l_6_143 = nil
                local l_6_144 = nil
                local l_6_145 = nil
                ;
                (table.insert)(l_6_9.Processed, {enumerateregistrykey = l_6_29})
              end
            end
            -- DECOMPILER ERROR at PC1013: Confused about usage of register R39 for local variables in 'ReleaseLocals'

          end
          l_6_29 = l_6_20.deleteregistryvalue
          if l_6_29 then
            l_6_29 = ""
            l_6_30 = l_6_20.deleteregistryvalue
            l_6_74 = split
            l_6_74 = l_6_74(l_6_30, ",")
            local l_6_146 = nil
            for l_6_150,l_6_151 in ipairs(l_6_74) do
              local l_6_147, l_6_148, l_6_149, l_6_150, l_6_151 = nil
              l_6_80 = string
              l_6_80 = l_6_80.lower
              -- DECOMPILER ERROR at PC1030: Confused about usage of register: R23 in 'UnsetPending'

              l_6_80 = l_6_80((MpCommon.Base64Decode)(l_6_79))
              local l_6_152 = nil
              if l_6_29 ~= nil then
                l_6_29 = explode(l_6_80, "|")
                if #l_6_29 == 2 then
                  local l_6_153 = nil
                  local l_6_154 = nil
                  -- DECOMPILER ERROR at PC1047: Confused about usage of register: R27 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1050: Confused about usage of register: R25 in 'UnsetPending'

                  local l_6_155 = nil
                  if (sysio.RegOpenKey)(l_6_29[1]) ~= nil then
                    (mp.set_mpattribute)("/EnablePrecPulseScanner")
                    -- DECOMPILER ERROR at PC1061: Confused about usage of register: R25 in 'UnsetPending'

                    local l_6_156 = nil
                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", l_6_2, (string.format)("%s\\\\%s", l_6_29[1], l_6_29[2]), l_6_89, l_6_90, 500, 1)
                    -- DECOMPILER ERROR at PC1078: Overwrote pending register: R33 in 'AssignReg'

                    local l_6_157, l_6_158 = nil
                    -- DECOMPILER ERROR at PC1083: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1083: Overwrote pending register: R33 in 'AssignReg'

                    ;
                    (mp.TriggerScanResource)("regkey", l_6_89)
                    -- DECOMPILER ERROR at PC1087: Overwrote pending register: R33 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1088: Overwrote pending register: R34 in 'AssignReg'

                    AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", l_6_89, l_6_90, 1, l_6_6, 500, 1)
                    -- DECOMPILER ERROR at PC1097: Overwrote pending register: R33 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1098: Overwrote pending register: R34 in 'AssignReg'

                    local l_6_159, l_6_160 = nil
                    -- DECOMPILER ERROR at PC1101: Overwrote pending register: R33 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1102: Overwrote pending register: R33 in 'AssignReg'

                    -- DECOMPILER ERROR at PC1103: Overwrote pending register: R34 in 'AssignReg'

                    l_6_89(l_6_90, (string.format)("%s\\\\%s", l_6_29[1], l_6_29[2]))
                  else
                    -- DECOMPILER ERROR at PC1108: Confused about usage of register: R25 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1108: Confused about usage of register: R28 in 'UnsetPending'

                  end
                  local l_6_161 = nil
                  -- DECOMPILER ERROR at PC1111: Overwrote pending register: R29 in 'AssignReg'

                  local l_6_162 = nil
                  local l_6_163 = nil
                  -- DECOMPILER ERROR at PC1113: Confused about usage of register: R25 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1113: Overwrote pending register: R31 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1115: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1115: Overwrote pending register: R33 in 'AssignReg'

                  ;
                  (table.insert)(pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyscan", l_6_2, l_6_89), {deleteregistryvalue = pcall(MpCommon.RollingQueueQueryKeyNamespaced, l_6_89, l_6_90, (string.format)("%s\\\\%s", l_6_29[1], l_6_29[2])) .. " " .. l_6_89})
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
              l_6_74 = "%windir%"
              l_6_30 = l_6_30(l_6_74)
              l_6_74 = l_6_30
              l_6_74 = l_6_74 .. "\\system32\\"
              local l_6_164 = nil
              local l_6_165 = nil
              if #(sysio.GetProcessFromFileName)(l_6_74 .. "services.exe") > 0 then
                l_6_29 = (string.format)("pid:%d,ProcessStart:%u", (((sysio.GetProcessFromFileName)(l_6_74 .. "services.exe"))[1]).pid, (((sysio.GetProcessFromFileName)(l_6_74 .. "services.exe"))[1]).starttime)
              end
            end
            l_6_30 = table
            l_6_30 = l_6_30.insert
            l_6_74 = l_6_9.Processed
            local l_6_166 = nil
            local l_6_167 = nil
            l_6_30(l_6_74, {process = l_6_20.process})
            l_6_30 = MpCommon
            l_6_30 = l_6_30.BmTriggerSig
            l_6_74 = l_6_29
            l_6_30(l_6_74, "Heimdall_ProcessDispatch", l_6_20.process)
          end
          l_6_29 = l_6_20.firewall
          if l_6_29 then
            l_6_29 = l_6_20.firewall
            l_6_30 = split
            l_6_74 = l_6_29
            l_6_30 = l_6_30(l_6_74, ",")
            l_6_74 = ipairs
            l_6_74 = l_6_74(l_6_30)
            for l_6_171,l_6_172 in l_6_74 do
              local l_6_168, l_6_169, l_6_170, l_6_171, l_6_172 = nil
              -- DECOMPILER ERROR at PC1183: Confused about usage of register: R22 in 'UnsetPending'

              local l_6_173 = nil
              -- DECOMPILER ERROR at PC1187: Overwrote pending register: R24 in 'AssignReg'

              -- DECOMPILER ERROR at PC1188: Overwrote pending register: R24 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_80) then
                local l_6_174 = nil
                local l_6_175 = nil
                local l_6_176 = nil
                l_6_80(l_6_9.Processed, {firewall = (MpCommon.Base64Decode)(l_6_80)})
                -- DECOMPILER ERROR at PC1193: Overwrote pending register: R24 in 'AssignReg'

                l_6_80 = l_6_80((MpCommon.Base64Decode)(l_6_80), "_")
                l_6_80 = #l_6_80
                if l_6_80 == 3 then
                  l_6_80 = tonumber
                  -- DECOMPILER ERROR at PC1202: Confused about usage of register: R23 in 'UnsetPending'

                  l_6_80 = l_6_80(l_6_80[2])
                  -- DECOMPILER ERROR at PC1206: Confused about usage of register: R23 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1208: Confused about usage of register: R23 in 'UnsetPending'

                  local l_6_177 = nil
                  ;
                  (MpCommon.AddBlockingFirewallRule)(l_6_80[1], tonumber(l_6_80[3]), (mp.bitand)(l_6_80, 2) == 2, (mp.bitand)(l_6_80, 1) == 1)
                end
              end
            end
          end
          l_6_29 = l_6_20.sinkholedns
          if l_6_29 then
            l_6_29 = l_6_20.sinkholedns
            l_6_30 = split
            l_6_30 = l_6_30(l_6_29, ",")
            for l_6_186,l_6_187 in ipairs(l_6_30) do
              local l_6_183, l_6_184, l_6_185, l_6_186, l_6_187 = nil
              -- DECOMPILER ERROR at PC1245: Confused about usage of register: R22 in 'UnsetPending'

              local l_6_188 = nil
              -- DECOMPILER ERROR at PC1247: Overwrote pending register: R24 in 'AssignReg'

              -- DECOMPILER ERROR at PC1248: Overwrote pending register: R24 in 'AssignReg'

              local l_6_189 = nil
              local l_6_190 = nil
              local l_6_191 = nil
              l_6_80(l_6_9.Processed, {sinkholeDNS_data = (MpCommon.Base64Decode)(l_6_80)})
              -- DECOMPILER ERROR at PC1255: Overwrote pending register: R24 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_80) then
                l_6_80 = l_6_80((MpCommon.Base64Decode)(l_6_80), "_")
                -- DECOMPILER ERROR at PC1261: Overwrote pending register: R24 in 'AssignReg'

                -- DECOMPILER ERROR at PC1264: Confused about usage of register: R23 in 'UnsetPending'

                l_6_80 = l_6_80(l_6_80[1], tonumber(l_6_80[2]))
                -- DECOMPILER ERROR at PC1269: Confused about usage of register: R23 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1271: Confused about usage of register: R23 in 'UnsetPending'

                local l_6_192 = nil
                l_6_9["sinkholedns" .. "_" .. l_6_80[1] .. "_" .. l_6_80[2]] = {res = l_6_80, isAllowed = l_6_80[1]}
              end
            end
          end
          l_6_29 = l_6_20.dnscache
          if l_6_29 then
            l_6_29 = l_6_20.dnscache
            l_6_30 = split
            l_6_30 = l_6_30(l_6_29, ",")
            for l_6_196,l_6_197 in ipairs(l_6_30) do
              local l_6_193, l_6_194, l_6_195, l_6_196, l_6_197 = nil
              -- DECOMPILER ERROR at PC1293: Confused about usage of register: R22 in 'UnsetPending'

              local l_6_198 = nil
              -- DECOMPILER ERROR at PC1295: Overwrote pending register: R24 in 'AssignReg'

              -- DECOMPILER ERROR at PC1296: Overwrote pending register: R24 in 'AssignReg'

              local l_6_199 = nil
              local l_6_200 = nil
              local l_6_201 = nil
              l_6_80(l_6_9.Processed, {dnscache = (MpCommon.Base64Decode)(l_6_80)})
              -- DECOMPILER ERROR at PC1303: Overwrote pending register: R24 in 'AssignReg'

              if (MpCommon.Base64Decode)(l_6_80) then
                l_6_80 = l_6_80((MpCommon.Base64Decode)(l_6_80), "_")
                for i_1,i_2 in ipairs(l_6_80) do
                  local l_6_202, l_6_203, l_6_204 = nil
                  l_6_9["dnscache" .. "_" .. i_2], l_6_80 = l_6_80, {[i_2] = (mp.GetDnsCacheRecordsByType)(i_2)}
                end
              end
            end
          end
          l_6_29 = l_6_20.debug
          if l_6_29 then
            l_6_29 = l_6_20.debug
            l_6_30 = split
            l_6_30 = l_6_30(l_6_29, ",")
            local l_6_205 = nil
            for l_6_209,l_6_210 in ipairs(l_6_30) do
              local l_6_206, l_6_207, l_6_208, l_6_209, l_6_210 = nil
              l_6_80 = MpCommon
              l_6_80 = l_6_80.Base64Decode
              -- DECOMPILER ERROR at PC1342: Confused about usage of register: R23 in 'UnsetPending'

              l_6_80 = l_6_80(l_6_80)
              local l_6_211 = nil
              local l_6_212 = nil
              local l_6_213 = nil
              local l_6_214 = nil
              ;
              (table.insert)(l_6_9.Processed, {debug = l_6_80})
              for l_6_218,l_6_219 in ipairs((split(l_6_80, "_"))) do
                local l_6_215, l_6_216, l_6_217, l_6_218, l_6_219 = nil
                -- DECOMPILER ERROR at PC1359: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1360: Confused about usage of register: R32 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1360: Overwrote pending register: R34 in 'AssignReg'

                -- DECOMPILER ERROR at PC1364: Overwrote pending register: R26 in 'AssignReg'

                -- DECOMPILER ERROR at PC1365: Confused about usage of register: R32 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1365: Overwrote pending register: R27 in 'AssignReg'

                -- DECOMPILER ERROR at PC1368: Confused about usage of register: R26 in 'UnsetPending'

                -- DECOMPILER ERROR at PC1368: Overwrote pending register: R33 in 'AssignReg'

                -- DECOMPILER ERROR at PC1369: Overwrote pending register: R34 in 'AssignReg'

                -- DECOMPILER ERROR at PC1371: Overwrote pending register: R33 in 'AssignReg'

                if nil == "PC" then
                  local l_6_220 = nil
                  -- DECOMPILER ERROR at PC1372: Overwrote pending register: R34 in 'AssignReg'

                  -- DECOMPILER ERROR at PC1376: Confused about usage of register: R27 in 'UnsetPending'

                  l_6_90 = l_6_90(pcall(MpCommon.GetPersistContext, nil))
                else
                  -- DECOMPILER ERROR at PC1381: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1383: Confused about usage of register: R26 in 'UnsetPending'

                  -- DECOMPILER ERROR at PC1383: Overwrote pending register: R33 in 'AssignReg'

                  if nil == "PCNP" then
                    l_6_90 = ":"
                    -- DECOMPILER ERROR at PC1385: Confused about usage of register: R27 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1386: Overwrote pending register: R33 in 'AssignReg'

                    local l_6_221 = nil
                    l_6_90 = table_pack
                    -- DECOMPILER ERROR at PC1391: Confused about usage of register: R27 in 'UnsetPending'

                    l_6_90 = l_6_90(pcall(MpCommon.GetPersistContextNoPath, nil))
                  else
                    -- DECOMPILER ERROR at PC1396: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1398: Confused about usage of register: R26 in 'UnsetPending'

                    -- DECOMPILER ERROR at PC1398: Overwrote pending register: R33 in 'AssignReg'

                    if nil == "RQ" then
                      l_6_90 = ":"
                      -- DECOMPILER ERROR at PC1400: Confused about usage of register: R27 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1401: Overwrote pending register: R33 in 'AssignReg'

                      local l_6_222 = nil
                      l_6_90 = table_pack
                      -- DECOMPILER ERROR at PC1406: Confused about usage of register: R27 in 'UnsetPending'

                      l_6_90 = l_6_90(pcall(MpCommon.RollingQueueQuery, nil))
                    else
                      -- DECOMPILER ERROR at PC1411: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1413: Confused about usage of register: R26 in 'UnsetPending'

                      -- DECOMPILER ERROR at PC1413: Overwrote pending register: R33 in 'AssignReg'

                      if nil == "AC" then
                        l_6_90 = ":"
                        -- DECOMPILER ERROR at PC1415: Confused about usage of register: R27 in 'UnsetPending'

                        -- DECOMPILER ERROR at PC1416: Overwrote pending register: R33 in 'AssignReg'

                        local l_6_223 = nil
                        l_6_90 = table_pack
                        -- DECOMPILER ERROR at PC1421: Confused about usage of register: R27 in 'UnsetPending'

                        l_6_90 = l_6_90(pcall(MpCommon.AtomicCounterValueEx, nil))
                      end
                    end
                  end
                end
              end
            end
            l_6_9.debug = {[l_6_89] = l_6_90, [l_6_89] = l_6_90, [l_6_89] = l_6_90, [l_6_89] = l_6_90}
          end
          l_6_29 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
          l_6_10.report = safeJsonSerialize(l_6_9, 260)
          l_6_10.TAG = "NOLOOKUP"
          SafeGetUrlReputation(l_6_30, l_6_10, false, 2000)
          -- DECOMPILER ERROR at PC1445: Confused about usage of register R38 for local variables in 'ReleaseLocals'

          -- DECOMPILER ERROR: 60 unprocessed JMP targets
        end
      end
    end
  end
end


