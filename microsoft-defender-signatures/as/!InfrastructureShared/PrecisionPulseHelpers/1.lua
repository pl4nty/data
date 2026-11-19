-- Threat: !InfrastructureShared
-- Name: PrecisionPulseHelpers
-- Type: 1
-- Includes: LuaFuncHelper, BMLuaLib

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

function ReportSupportLog(p1_0)
  local r1_0 = MpCommon.ExpandEnvironmentVariables
  local r1_1 = (r1_0("%ProgramData%") or "C:\\ProgramData")
    .. "\\Microsoft\\Windows Defender\\Support"
  local r1_2, r1_3 = "hmdprecisionpulse", 86400
  local r1_4 = sysio.FindFiles(r1_1, "*", 1)
  for r1_5, r1_6 in pairs(r1_4) do
    if string.find(r1_6, "MpWppTracing", 1, true)
      or string.find(r1_6, "MPScanSkip", 1, true)
      or string.find(r1_6, "MPLog", 1, true) then
      local r1_7 = 0
      local r1_8 = r1_6
      local r1_9, r1_10 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
        "hmdprecisionpulsereportresource", r1_2, r1_8)
      if r1_9 and r1_10 then
        r1_7 = tonumber(r1_10)
      end
      local r1_11 = MpCommon.GetCurrentTimeT()
      local r1_12 = sysio.GetFileSize(r1_6)
      local r1_13 = sysio.GetFileLastWriteTime(r1_6)
      local r1_14 = {}
      r1_14.ReadTimeStamp = r1_11
      r1_14.tracking_id = p1_0
      r1_14.Size = r1_12
      r1_14.LastModified = r1_13
      local r1_15 = sysio.ReadFile(r1_6, r1_7, r1_12)
      local r1_16 = sysio.GetLastResult()
      if r1_16.Success then
        r1_15 = MpCommon.Base64Encode(r1_15)
        ReportResource(r1_6, r1_15, r1_14, "LUA")
      else
        r1_14.Facility = r1_16.Facility
        r1_14.Code = r1_16.Code
        ReportResource(r1_6, "NULL", r1_14, "LUA")
      end
    end
  end
end

function CollectFile(p2_0, p2_1, p2_2)
  p2_1 = p2_1 == nil and (sysio.GetFileSize(p2_0) or 0) or p2_1
  local r2_0 = 2086912
  if p2_2 then
    r2_0 = r2_0 * 18
  end
  local r2_1 = nil
  local r2_2 = MpCommon.GetCurrentTimeT()
  if r2_0 < p2_1 then
    r2_1 = sysio.ReadFile(p2_0, 0, r2_0)
  else
    r2_1 = sysio.ReadFile(p2_0, 0, p2_1)
  end
  local r2_3 = {}
  local r2_4 = sysio.GetLastResult()
  if r2_4.Success then
    local r2_5, r2_6, r2_7, r2_8 = nil, nil, nil, nil
    if r2_0 < p2_1 then
      r2_5, r2_6, r2_7, r2_8 = r2_5, r2_6, crypto.Sha1Buffer(r2_1, 0, #r2_1), crypto.Sha256Buffer(r2_1,
        0, #r2_1)
    else
      r2_5, r2_6, r2_7, r2_8 = crypto.Sha1Buffer(r2_1, 0, #r2_1), crypto.Sha256Buffer(r2_1, 0, #r2_1), r2_7, r2_8
    end
    if r2_1 then
      local r2_9 = MpCommon.Base64Encode(r2_1)
      local r2_10 = {}
      r2_10.Sha1 = r2_5
      r2_10.Sha256 = r2_6
      r2_10.PartialSha1 = r2_7
      r2_10.PartialSha256 = r2_8
      r2_10.ReadTimeStamp = r2_2
      local r2_11 = r2_9
      local r2_12 = r2_10
      return r2_11, r2_12
    end
    return nil, {}
  end
  return nil, { Error_Facility = r2_4.Facility, Error_Code = r2_4.Code }
end

local function r0_0(p3_0, p3_1, p3_2)
  local r3_0, r3_1 = 1, 0
  local r3_2 = #p3_1
  local r3_3, r3_4, r3_5, r3_6 = 0, 64500, 1000, "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update"
  while r3_0 <= r3_2 do
    local r3_7 = p3_1:sub(r3_0, r3_0 + r3_5 - 1)
    local r3_8 = #r3_7
    if r3_4 < r3_3 + r3_8 then
      break
    end
    p3_0["ResourceContent_" .. r3_1] = r3_7
    r3_3 = r3_3 + r3_8
    r3_0 = r3_0 + r3_5
    r3_1 = r3_1 + 1
  end
  local r3_9 = { [1] = r3_6 .. "?indx=" .. p3_2 }
  local r3_10 = SafeGetUrlReputation
  local r3_11 = r3_9
  local r3_12 = p3_0
  r3_10 = r3_10(r3_11, r3_12, false, 2000 + p3_2 * 500, false, false)
  if r3_10.error == 3 then
    r3_10 = SafeGetUrlReputation(r3_9, p3_0, false, 2000 + p3_2 * 500, false, false)
  end
  return r3_10
end

function ReportResource(p4_0, p4_1, p4_2, p4_3)
  p4_2 = p4_2 or {}
  if not (p4_1 and p4_0) then
    return
  end
  local r4_0, r4_1 = "hmdprecisionpulse", 86400
  local r4_2 = p4_2.Sha256 or p4_2.PartialSha256
  local r4_3 = nil
  if r4_2 then
    r4_3 = p4_0 .. "|" .. r4_2
    local r4_4, r4_5 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
      "hmdprecisionpulsereportresource", r4_0, r4_3)
    if r4_4 and r4_5 then
      return
    end
  end
  local r4_6, r4_7 = 64500, 576
  local r4_8 = #p4_1
  local r4_9, r4_10 = 1, 0
  local r4_11 = #p4_1
  local r4_12, r4_13 = 0, r4_11
  while r4_13 > 0 do
    r4_12 = r4_12 + 1
    r4_13 = r4_13 - r4_6
  end
  local r4_14
  if r4_7 < r4_12 then
    r4_14 = r4_7
  else
    r4_14 = r4_12
  end
  local r4_15 = r4_14 - 1
  local r4_16 = {}
  local r4_17 = 0
  local r4_18 = safeJsonSerialize(p4_2)
  while r4_9 <= r4_11 and r4_10 < r4_7 do
    local r4_19 = {}
    r4_19.SIG_CONTEXT = "Lua_Custom_Upload_Resource"
    r4_19.CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE"
    r4_19.TAG = "NOLOOKUP"
    r4_19.ResourceName = p4_0
    r4_19.ResourceInfo = r4_18
    r4_19.ResourceSize = r4_11
    r4_19.LastIndex = r4_15
    r4_19.Source = p4_3
    r4_19.Index = r4_10
    local r4_20 = p4_1:sub(r4_9, r4_9 + r4_6 - 1)
    r4_9 = r4_9 + r4_6
    local r4_21 = nil
    local r4_22, r4_23 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
      "hmdprecisionpulsereportresource_failedIndexes", r4_0, r4_3)
    if r4_22 and r4_23 and r4_23.value then
      r4_21 = tostring(r4_23.value)
    end
    local r4_24 = r4_21 or "None"
    r4_19.PreviousFailedIndexes = r4_24
    local r4_25, r4_26 = pcall(r0_0, r4_19, r4_20, r4_10)
    if r4_25 and r4_26 and not r4_26.error then
      r4_17 = r4_17 + 1
    else
      if r4_21 then
        local r4_27 = r4_21
        local r4_28 = r4_10
        r4_21 = r4_27 .. "," .. r4_28
      else
        r4_21 = r4_10
      end
      AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource_failedIndexes", r4_0, r4_3,
        r4_21, r4_1, 500, 1)
    end
    r4_10 = r4_10 + 1
  end
  if r4_17 == r4_14 then
    if r4_2 then
      local r4_29, r4_30 = p4_0, r4_2
      r4_29 = r4_29 .. "|" .. r4_30
      local r4_31 = AppendToRollingQueueNamespaced
      r4_30 = "hmdprecisionpulsereportresource"
      r4_31(r4_30, r4_0, r4_29, 1, r4_1, 500, 1)
    else
      local r4_32 = string.find(p4_0, "MpWppTracing", 1, true)
      if r4_32 or string.find(p4_0, "MPScanSkip", 1, true) or string.find(p4_0, "MPLog", 1, true) then
        r4_32 = r4_7 * r4_6
        if r4_11 < r4_32 then
          r4_32 = r4_11
        end
        local r4_33 = p4_0
        AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource", r4_0, r4_33, r4_32, r4_1,
          500, 1)
      end
    end
  end
end

function MamadutReport()
  local r5_0 = reportRelevantUntrustedEntities(0)
  if r5_0 and next(r5_0) then
    bm.add_related_string("UntrustedEntities", safeJsonSerialize(r5_0), bm.RelatedStringBMReport)
    local r5_1 = {
      ".dll", ".jar", ".swf", ".doc", ".rtf", ".html", ".pdb", ".7z", ".xz", ".001", ".chm", ".zip",
      ".rar", ".saz", ".cpp", ".cs", ".c", ".csproj", ".sln", ".ps1", ".py", ".js", ".jse", ".vbe",
      ".vbs", ".wsf", ".bat", ".cmd", ".go", ".rs", ".nim"
    }
    for r5_2, r5_3 in ipairs(r5_0) do
      local r5_4 = sysio.IsFileExists(r5_3)
      if r5_4 and Contains_any_caseinsenstive(r5_3, r5_1) then
        if string.find(r5_3, ".dll", -4, true) and mp.IsKnownFriendlyFile(r5_3, true, false) == true then
          r5_4 = false
        else
          local r5_5
          r5_4 = r5_5
        end
        if r5_4 then
          local r5_6 = sysio.GetFileSize(r5_3)
          local r5_7 = sysio.GetFileLastWriteTime(r5_3)
          local r5_8, r5_9, r5_10 = pcall(CollectFile, r5_3, r5_6, true)
          if r5_8 and r5_10 then
            r5_10.Size = r5_6
            r5_10.LastModified = r5_7
            if r5_9 then
              ReportResource(r5_3, r5_9, r5_10, "BM_Mamadut")
              bm.add_related_string("FileReported_" .. r5_3, safeJsonSerialize(r5_10),
                bm.RelatedStringBMReport)
            else
              bm.add_related_string("FileReadFailed_" .. r5_3, safeJsonSerialize(r5_10),
                bm.RelatedStringBMReport)
            end
          end
        end
      end
    end
  end
  local r5_11, r5_12 = pcall(reportBmInfo)
  if not r5_11 and r5_12 then
    bm.add_related_string("bmInfoFailReason", tostring(r5_12), bm.RelatedStringBMReport)
  end
  reportSessionInformation()
  add_parents()
  reportTimingData()
end

function EnablePrecisionPulse(p6_0, p6_1, p6_2, p6_3, p6_4)
  local r6_0, r6_1, r6_2, r6_3 = 60, 300, nil, 500
  local r6_4 = {}
  local r6_5 = {}
  r6_4.Processed = r6_5
  r6_5 = {}
  r6_4.FolderEnumeration = r6_5
  r6_5 = {}
  r6_4.ScanPath = r6_5
  r6_5 = {}
  r6_4.FullFilePathScan = r6_5
  r6_5 = {}
  r6_4.RegkeyEnumeration = r6_5
  r6_5 = {}
  r6_4.DeleteRegValue = r6_5
  r6_5 = {
    SIG_CONTEXT = "LUA_GENERIC", CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE", TAG = "NOLOOKUP"
  }
  local r6_6 = {}
  local r6_7 = split(p6_0, "++")
  for r6_8, r6_9 in ipairs(r6_7) do
    local r6_10, r6_11 = r6_9:match("(.+)::(.+)")
    if r6_10 and r6_11 then
      r6_6[r6_10] = r6_11
    end
  end
  local r6_12 = {}
  local r6_13 = r6_6
  for r6_14, r6_15 in pairs(r6_13) do
    r6_12[r6_14] = r6_15
  end
  if r6_12.tracking_id then
    r6_2 = r6_12.tracking_id
  end
  r6_2 = r6_2 == nil and "10000000-0000-ffff-0000-000000000001" or r6_2
  table.insert(r6_4.Processed, { TrackingId = r6_2 })
  if r6_12.ttl then
    r6_1 = r6_12.ttl
    table.insert(r6_4.Processed, { Ttl = r6_1 })
  end
  if r6_12.suppress_ttl then
    r6_0 = r6_12.suppress_ttl
    table.insert(r6_4.Processed, { suppress_ttl = r6_0 })
  end
  local r6_16 = MpCommon.AtomicCounterValueNamespaced(p6_3, p6_2)
  if r6_16 == nil then
    MpCommon.AtomicCounterSetNamespaced(p6_3, p6_2, 0, r6_0)
  end
  if r6_12.maxscan then
    local r6_17 = tonumber(r6_12.maxscan)
    r6_3 = r6_17 or 500
    r6_17 = MpCommon
    r6_17 = r6_17.AtomicCounterValueNamespaced
    r6_17 = r6_17(p6_4, p6_2)
    if r6_17 == nil then
      MpCommon.AtomicCounterSetNamespaced(p6_4, p6_2, r6_3, r6_1)
    else
      MpCommon.AtomicCounterSubNamespaced(p6_4, p6_2, r6_17)
      MpCommon.AtomicCounterAddNamespaced(p6_4, p6_2, r6_3)
    end
    table.insert(r6_4.Processed, { max_scan = r6_3 })
  end
  if r6_12.scanpath then
    local r6_18 = r6_12.scanpath
    local r6_19 = split(r6_18, ",")
    for r6_20, r6_21 in ipairs(r6_19) do
      local r6_22 = string.lower(MpCommon.Base64Decode(r6_21))
      table.insert(r6_4.Processed, { scanpath = r6_22 })
      AppendToRollingQueueNamespaced("hmdprecisionpulsefolderscan", p6_2, r6_22, 1, r6_1, 500, 1)
      mp.TriggerScanResource("folder", r6_22, 0, 5000)
      r6_4.ScanPath[r6_22] = {}
      table.insert(r6_4.Processed, { scanpath = r6_22 })
      if sysio.IsFolderExists(r6_22) then
        local r6_23 = r6_4.ScanPath[r6_22]
        r6_23.Exists = true
        r6_23 = r6_4.ScanPath[r6_22]
        local r6_24 = sysio.IsPathAVExcluded(r6_22, true)
        r6_23.Excluded = r6_24
      else
        r6_4.ScanPath[r6_22].Exists = false
      end
    end
  end
  if r6_12.fullfilepathscan then
    local r6_25 = r6_12.fullfilepathscan
    local r6_26 = split(r6_25, ",")
    for r6_27, r6_28 in ipairs(r6_26) do
      local r6_29 = string.lower(MpCommon.Base64Decode(r6_28))
      if string.find(r6_29, "\\windows defender\\support", 1, true) then
        pcall(ReportSupportLog, r6_2)
      end
      local r6_30 = sysio.IsFileExists(r6_29)
      table.insert(r6_4.Processed, { fullfilepathscan = r6_29 })
      r6_4.FullFilePathScan[r6_29] = {}
      local r6_31 = true
      if r6_30 then
        local r6_32 = string.match(r6_29, "(.-)[\\/][^\\/]*$")
        r6_4.FullFilePathScan[r6_29].Exists = true
        local r6_33, r6_34 = pcall(IsAVExcluded, r6_32)
        r6_34 = r6_34 ~= nil and r6_34
        r6_4.FullFilePathScan[r6_29].Excluded = sysio.IsPathAVExcluded(r6_32, true)
        r6_4.FullFilePathScan[r6_29].Excluded_LUA_API = r6_34
        if r6_4.FullFilePathScan[r6_29].Excluded == true and r6_34 == true then
          r6_31 = false
        end
      else
        r6_31 = false
        r6_4.FullFilePathScan[r6_29].Exists = false
      end
      local r6_35, r6_36 = pcallEx("AppendToRollingQueueNamespaced", AppendToRollingQueueNamespaced,
        "hmdprecisionpulsefullfilepathscan", p6_2, r6_29, 1, r6_1, 500, 1)
      if not r6_35 then
        local r6_37 = GetRollingQueueKeys("LuaError")
        if r6_37 and type(r6_37) == "table" then
          r6_4.FullFilePathScan[r6_29].RQErrors = safeJsonSerialize(r6_37, 260)
        end
      end
      if r6_31 then
        mp.TriggerScanResource("file", r6_29, 0, 10000)
        local r6_38 = MpCommon.ExpandEnvironmentVariables("%windir%")
        if r6_38 then
          local r6_39 = r6_38 .. "\\system32\\"
          local r6_40 = sysio.GetProcessFromFileName(r6_39 .. "services.exe")
          if #r6_40 > 0 then
            local r6_41 = string.format("pid:%d,ProcessStart:%u", r6_40[1].pid, r6_40[1].starttime)
            if r6_41 then
              MpCommon.BmTriggerSig(r6_41, "hmdprecisionpulsefullfilepathscan_statuscheck", r6_29)
            end
          end
        end
      end
    end
  end
  if r6_12.scanfile then
    local r6_42 = r6_12.scanfile
    local r6_43 = split(r6_42, ",")
    for r6_44, r6_45 in ipairs(r6_43) do
      local r6_46 = string.lower(MpCommon.Base64Decode(r6_45))
      table.insert(r6_4.Processed, { scanfile = r6_46 })
      AppendToRollingQueueNamespaced("hmdprecisionpulsescanfile", p6_2, r6_46, 1, r6_1, 500, 1)
    end
  end
  if r6_12.enumeratefolder then
    local r6_47, r6_48, r6_49, r6_50, r6_51, r6_52 = 260, "", "*", 0, true, true
    local r6_53 = r6_12.enumeratefolder
    local r6_54 = split(r6_53, ",")
    local r6_55 = 0
    for r6_56, r6_57 in ipairs(r6_54) do
      r6_55 = r6_55 + 1
      if r6_47 < r6_55 then
        r6_4.FolderEnumeration[r6_48].ExceededMaxFoldersEnumerated = true
        break
      end
      local r6_58 = string.lower(MpCommon.Base64Decode(r6_57))
      local r6_59 = explode(r6_58, "|")
      if #r6_59 == 4 then
        r6_48 = r6_59[1]
        r6_49 = r6_59[2]
        local r6_60 = tonumber(r6_59[3])
        r6_50 = r6_60 or 0
        r6_60 = tonumber
        r6_60 = r6_60(r6_59[4])
        r6_51 = r6_60 == 1
      elseif #r6_59 == 5 then
        r6_48 = r6_59[1]
        r6_49 = r6_59[2]
        local r6_61 = tonumber(r6_59[3])
        r6_50 = r6_61 or 0
        r6_61 = tonumber
        r6_61 = r6_61(r6_59[4])
        r6_51 = r6_61 == 1
        r6_61 = tonumber
        r6_61 = r6_61(r6_59[5])
        r6_52 = r6_61 == 1
      else
        r6_48 = r6_59[1]
      end
      if r6_48 ~= nil then
        local r6_62 = #r6_48 + 2
        local r6_63 = r6_4.FolderEnumeration
        local r6_64 = {}
        r6_63[r6_48] = r6_64
        r6_63 = r6_4.FolderEnumeration[r6_48]
        r6_64 = {}
        r6_63.Files = r6_64
        r6_63 = r6_4.FolderEnumeration[r6_48]
        r6_64 = {}
        r6_63.Subfolders = r6_64
        r6_63 = sysio.FindFiles
        r6_64 = r6_48
        r6_63 = r6_63(r6_64, r6_49, r6_50)
        local r6_65 = sysio.FindFolders(r6_48, "*", 0)
        if r6_63 ~= nil then
          local r6_66 = 0
          local r6_67, r6_68, r6_69 = pairs(r6_63)
          for r6_70, r6_71 in r6_67, r6_68, r6_69 do
            r6_66 = r6_66 + 1
            if r6_47 < r6_66 then
              local r6_72 = r6_4.FolderEnumeration[r6_48]
              r6_72.ExceededMaxFilesReported = true
              r6_72 = r6_4.FolderEnumeration[r6_48]
              r6_72.TotalFilesEnumerated = #r6_63
              break
            end
            local r6_73 = string.sub(r6_71, r6_62)
            if r6_52 then
              local r6_74 = sysio.GetFileSize(r6_71)
              local r6_75 = sysio.GetFileLastWriteTime(r6_71)
              table.insert(r6_4.FolderEnumeration[r6_48].Files,
                { Name = r6_73, Size = r6_74, LastModified = r6_75 })
              r6_66 = r6_66 + 1
            end
            if r6_51 then
              if r6_3 <= MpCommon.AtomicCounterAddNamespaced(p6_3, p6_2, 1) then
                r6_4.FolderEnumeration[r6_48].ExceededMaxScanCounter = true
                break
              end
              AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", p6_2,
                string.lower(r6_71), 1, r6_1, 500, 1)
              mp.TriggerScanResource("file", string.lower(r6_71), 0, 5000)
            end
          end
        end
        table.insert(r6_4.Processed, { enumeratefolder = r6_48 })
        if sysio.IsFolderExists(r6_48) then
          local r6_76 = r6_4.FolderEnumeration[r6_48]
          r6_76.Exists = true
          r6_76 = r6_4.FolderEnumeration[r6_48]
          local r6_77 = sysio.IsPathAVExcluded(r6_48, true)
          r6_76.Excluded = r6_77
        else
          r6_4.FolderEnumeration[r6_48].Exists = false
        end
        if r6_52 == false then
          if #r6_63 <= r6_47 then
            table.insert(r6_4.FolderEnumeration[r6_48], { Files = r6_63 })
          else
            local r6_78 = {}
            for r6_79 = 1, r6_47 do
              r6_78[r6_79] = r6_63[r6_79]
            end
            table.insert(r6_4.FolderEnumeration[r6_48], { Files = r6_78 })
            local r6_80 = r6_4.FolderEnumeration[r6_48]
            r6_80.ExceededMaxFilesReported = true
            r6_80 = r6_4.FolderEnumeration[r6_48]
            r6_80.TotalFilesEnumerated = #r6_63
          end
        end
        if r6_65 ~= nil then
          local r6_81 = 0
          local r6_82, r6_83, r6_84 = pairs(r6_65)
          for r6_85, r6_86 in r6_82, r6_83, r6_84 do
            r6_81 = r6_81 + 1
            if r6_47 < r6_81 then
              break
            end
            local r6_87 = string.sub(r6_86, r6_62)
            table.insert(r6_4.FolderEnumeration[r6_48].Subfolders, r6_87)
          end
        end
        AppendToRollingQueueNamespaced("hmdprecisionpulseenumeratefolder", p6_2, r6_48, 1, r6_1, 500,
          1)
      end
    end
  end
  if r6_12.enumerateregistrykey then
    local r6_88 = ""
    local r6_89 = r6_12.enumerateregistrykey
    local r6_90 = split(r6_89, ",")
    for r6_91, r6_92 in ipairs(r6_90) do
      local r6_93 = string.lower(MpCommon.Base64Decode(r6_92))
      if r6_93 ~= nil then
        local r6_94 = sysio.RegOpenKey(r6_93)
        local r6_95 = r6_4.RegkeyEnumeration
        local r6_96 = {}
        r6_95[r6_93] = r6_96
        r6_95 = r6_4.RegkeyEnumeration[r6_93]
        r6_96 = {}
        r6_95.Keys = r6_96
        r6_95 = r6_4.RegkeyEnumeration[r6_93]
        r6_96 = {}
        r6_95.Values = r6_96
        if r6_94 then
          local r6_97 = sysio.RegEnumKeys(r6_94)
          local r6_98 = sysio.RegEnumValues(r6_94)
          if r6_97 ~= nil then
            table.insert(r6_4.RegkeyEnumeration[r6_93].Keys, r6_97)
            local r6_99 = sysio.GetRegValueAsString
            r6_99 = r6_99(r6_94, "") or "Value not set"
            local r6_100 = r6_4.RegkeyEnumeration
            r6_100 = r6_100[r6_93].Values
            local r6_101 = {}
            r6_100.Default = r6_101
            r6_100 = table.insert
            r6_101 = r6_4.RegkeyEnumeration
            r6_101 = r6_101[r6_93].Values.Default
            local r6_102 = r6_99
            r6_102 = r6_102 .. " (REG_SZ)"
            r6_100(r6_101, r6_102)
            if r6_98 ~= nil then
              local r6_103, r6_104, r6_105 = pairs(r6_98)
              for r6_106, r6_107 in r6_103, r6_104, r6_105 do
                local r6_108 = sysio.GetRegValueType(r6_94, r6_107)
                local r6_109 = nil
                if r6_108 == 1 then
                  local r6_110 = sysio.GetRegValueAsString(r6_94, r6_107)
                  local r6_111 = r6_110 or "Value not set"
                  r6_110 = r6_4.RegkeyEnumeration
                  r6_110 = r6_110[r6_93].Values
                  local r6_112 = {}
                  r6_110[r6_107] = r6_112
                  r6_110 = table
                  r6_110 = r6_110.insert
                  r6_112 = r6_4.RegkeyEnumeration
                  r6_112 = r6_112[r6_93].Values
                  r6_112 = r6_112[r6_107]
                  local r6_113 = r6_111
                  r6_113 = r6_113 .. " (REG_SZ)"
                  r6_110(r6_112, r6_113)
                elseif r6_108 == 2 then
                  local r6_114 = sysio.GetRegValueAsString(r6_94, r6_107)
                  local r6_115 = r6_114 or "Value not set"
                  r6_114 = r6_4.RegkeyEnumeration
                  r6_114 = r6_114[r6_93].Values
                  local r6_116 = {}
                  r6_114[r6_107] = r6_116
                  r6_114 = table
                  r6_114 = r6_114.insert
                  r6_116 = r6_4.RegkeyEnumeration
                  r6_116 = r6_116[r6_93].Values
                  r6_116 = r6_116[r6_107]
                  local r6_117 = r6_115
                  r6_117 = r6_117 .. " (REG_EXPAND_SZ)"
                  r6_114(r6_116, r6_117)
                elseif r6_108 == 3 then
                  local r6_118 = sysio.GetRegValueAsBinary(r6_94, r6_107)
                  local r6_119 = r6_118 or "Value not set"
                  r6_118 = r6_4.RegkeyEnumeration
                  r6_118 = r6_118[r6_93].Values
                  local r6_120 = {}
                  r6_118[r6_107] = r6_120
                  r6_118 = table
                  r6_118 = r6_118.insert
                  r6_120 = r6_4.RegkeyEnumeration
                  r6_120 = r6_120[r6_93].Values
                  r6_120 = r6_120[r6_107]
                  local r6_121 = r6_119
                  r6_121 = r6_121 .. " (REG_BINARY)"
                  r6_118(r6_120, r6_121)
                elseif r6_108 == 4 then
                  local r6_122 = sysio.GetRegValueAsDword(r6_94, r6_107)
                  local r6_123 = r6_122 or "Value not set"
                  r6_122 = r6_4.RegkeyEnumeration
                  r6_122 = r6_122[r6_93].Values
                  local r6_124 = {}
                  r6_122[r6_107] = r6_124
                  r6_122 = table
                  r6_122 = r6_122.insert
                  r6_124 = r6_4.RegkeyEnumeration
                  r6_124 = r6_124[r6_93].Values
                  r6_124 = r6_124[r6_107]
                  local r6_125 = r6_123
                  r6_125 = r6_125 .. " (REG_DWORD)"
                  r6_122(r6_124, r6_125)
                elseif r6_108 == 7 then
                  local r6_126 = sysio.GetRegValueAsMultiString(r6_94, r6_107)
                  local r6_127 = r6_126 or "Value not set"
                  r6_126 = r6_4.RegkeyEnumeration
                  r6_126 = r6_126[r6_93].Values
                  local r6_128 = {}
                  r6_126[r6_107] = r6_128
                  r6_126 = ipairs
                  r6_128 = r6_127
                  for r6_129, r6_130 in r6_126(r6_128) do
                    table.insert(r6_4.RegkeyEnumeration[r6_93].Values[r6_107],
                      r6_130 .. " (REG_MULTI_SZ)")
                  end
                elseif r6_108 == 11 then
                  local r6_131 = sysio.GetRegValueAsQword(r6_94, r6_107)
                  local r6_132 = r6_131 or "Value not set"
                  r6_131 = r6_4.RegkeyEnumeration
                  r6_131 = r6_131[r6_93].Values
                  local r6_133 = {}
                  r6_131[r6_107] = r6_133
                  r6_131 = table
                  r6_131 = r6_131.insert
                  r6_133 = r6_4.RegkeyEnumeration
                  r6_133 = r6_133[r6_93].Values
                  r6_133 = r6_133[r6_107]
                  local r6_134 = r6_132
                  r6_134 = r6_134 .. " (REG_QWORD)"
                  r6_131(r6_133, r6_134)
                else
                  local r6_135 = sysio.GetRegValueAsString(r6_94, r6_107)
                  local r6_136 = r6_135 or "Value not set"
                  r6_135 = r6_4.RegkeyEnumeration
                  r6_135 = r6_135[r6_93].Values
                  local r6_137 = {}
                  r6_135[r6_107] = r6_137
                  r6_135 = table
                  r6_135 = r6_135.insert
                  r6_137 = r6_4.RegkeyEnumeration
                  r6_137 = r6_137[r6_93].Values
                  r6_137 = r6_137[r6_107]
                  local r6_138 = r6_136
                  r6_138 = r6_138 .. " (UNKNOWN TYPE)"
                  r6_135(r6_137, r6_138)
                end
              end
            end
          end
        end
        table.insert(r6_4.Processed, { enumerateregistrykey = r6_93 })
      end
    end
  end
  if r6_12.deleteregistryvalue then
    local r6_139 = ""
    local r6_140 = r6_12.deleteregistryvalue
    local r6_141 = split(r6_140, ",")
    for r6_142, r6_143 in ipairs(r6_141) do
      local r6_144 = string.lower(MpCommon.Base64Decode(r6_143))
      if r6_139 ~= nil then
        r6_139 = explode(r6_144, "|")
        if #r6_139 == 2 then
          local r6_145 = r6_139[1]
          local r6_146 = r6_139[2]
          r6_4.DeleteRegValue[r6_145] = {}
          local r6_147 = sysio.RegOpenKey(r6_145)
          if r6_147 == nil then
            r6_4.DeleteRegValue[r6_145] = "Key not present"
          else
            mp.set_mpattribute("/EnablePrecPulseScanner")
            local r6_148 = string.format("%s\\\\%s", r6_145, r6_146)
            AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", p6_2, r6_148, 1, r6_1, 500,
              1)
            local r6_149, r6_150 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
              "hmdprecisionpulseregkeyscan", p6_2, r6_148)
            mp.TriggerScanResource("regkey", r6_145)
            AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", p6_2, r6_148, 1, r6_1,
              500, 1)
            pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", p6_2,
              r6_148)
            mp.TriggerScanResource("regkeyvalue", r6_148)
          end
          table.insert(r6_4.Processed, { deleteregistryvalue = r6_145 .. " " .. r6_146 })
        end
      end
    end
  end
  if r6_12.process then
    local r6_151 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if r6_151 == nil then
      local r6_152 = MpCommon.ExpandEnvironmentVariables("%windir%") .. "\\system32\\"
      local r6_153, r6_154 = sysio.GetProcessFromFileName, r6_152
      r6_154 = r6_154 .. "services.exe"
      r6_153 = r6_153(r6_154)
      if #r6_153 > 0 then
        r6_151 = string.format("pid:%d,ProcessStart:%u", r6_153[1].pid, r6_153[1].starttime)
      end
    end
    table.insert(r6_4.Processed, { process = r6_12.process })
    MpCommon.BmTriggerSig(r6_151, "Heimdall_ProcessDispatch", r6_12.process)
  end
  if r6_12.firewall then
    local r6_155 = r6_12.firewall
    local r6_156 = split(r6_155, ",")
    for r6_157, r6_158 in ipairs(r6_156) do
      local r6_159 = MpCommon.Base64Decode(r6_158)
      if r6_159 then
        table.insert(r6_4.Processed, { firewall = r6_159 })
        r6_159 = explode(r6_159, "_")
        if #r6_159 == 3 then
          local r6_160 = tonumber(r6_159[2])
          MpCommon.AddBlockingFirewallRule(r6_159[1], tonumber(r6_159[3]), mp.bitand(r6_160, 2) == 2,
            mp.bitand(r6_160, 1) == 1)
        end
      end
    end
  end
  if r6_12.sinkholedns then
    local r6_161 = r6_12.sinkholedns
    local r6_162 = split(r6_161, ",")
    for r6_163, r6_164 in ipairs(r6_162) do
      local r6_165 = MpCommon.Base64Decode(r6_164)
      table.insert(r6_4.Processed, { sinkholeDNS_data = r6_165 })
      if r6_165 then
        r6_165 = explode(r6_165, "_")
        local r6_166, r6_167 = MpCommon.AddDnsBlockListDomain(r6_165[1], tonumber(r6_165[2]))
        r6_4["sinkholedns" .. "_" .. r6_165[1] .. "_" .. r6_165[2]] = {
          res = r6_166, isAllowed = r6_167
        }
      end
    end
  end
  if r6_12.dnscache then
    local r6_168 = r6_12.dnscache
    local r6_169 = split(r6_168, ",")
    for r6_170, r6_171 in ipairs(r6_169) do
      local r6_172 = MpCommon.Base64Decode(r6_171)
      table.insert(r6_4.Processed, { dnscache = r6_172 })
      if r6_172 then
        r6_172 = explode(r6_172, "_")
        local r6_173 = {}
        for r6_174, r6_175 in ipairs(r6_172) do
          r6_173[r6_175] = mp.GetDnsCacheRecordsByType(r6_175)
          r6_4["dnscache" .. "_" .. r6_175] = r6_173
        end
      end
    end
  end
  if r6_12.debug then
    local r6_176 = r6_12.debug
    local r6_177 = split(r6_176, ",")
    local r6_178 = {}
    for r6_179, r6_180 in ipairs(r6_177) do
      local r6_181 = MpCommon.Base64Decode(r6_180)
      table.insert(r6_4.Processed, { debug = r6_181 })
      local r6_182 = split(r6_181, "_")
      local r6_183, r6_184, r6_185 = ipairs(r6_182)
      for r6_186, r6_187 in r6_183, r6_184, r6_185 do
        r6_187 = split(r6_187, ":")
        local r6_188 = r6_187[1]
        local r6_189 = r6_187[2]
        if r6_188 == "PC" then
          local r6_190 = r6_189
          local r6_191 = r6_188 .. ":" .. r6_190
          local r6_192 = table_pack
          r6_190 = pcall
          r6_192 = r6_192(r6_190(MpCommon.GetPersistContext, r6_189))
          r6_178[r6_191] = r6_192
        elseif r6_188 == "PCNP" then
          local r6_193 = r6_189
          local r6_194 = r6_188 .. ":" .. r6_193
          local r6_195 = table_pack
          r6_193 = pcall
          r6_195 = r6_195(r6_193(MpCommon.GetPersistContextNoPath, r6_189))
          r6_178[r6_194] = r6_195
        elseif r6_188 == "RQ" then
          local r6_196 = r6_189
          local r6_197 = r6_188 .. ":" .. r6_196
          local r6_198 = table_pack
          r6_196 = pcall
          r6_198 = r6_198(r6_196(MpCommon.RollingQueueQuery, r6_189))
          r6_178[r6_197] = r6_198
        elseif r6_188 == "AC" then
          local r6_199 = r6_189
          local r6_200 = r6_188 .. ":" .. r6_199
          local r6_201 = table_pack
          r6_199 = pcall
          r6_201 = r6_201(r6_199(MpCommon.AtomicCounterValueEx, r6_189))
          r6_178[r6_200] = r6_201
        end
      end
    end
    r6_4.debug = r6_178
  end
  local r6_202 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
  local r6_203 = { [1] = r6_202 }
  r6_5.report = safeJsonSerialize(r6_4, 260)
  r6_5.TAG = "NOLOOKUP"
  SafeGetUrlReputation(r6_203, r6_5, false, 2000)
end
