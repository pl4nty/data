-- Threat: !InfrastructureShared
-- Name: PrecisionPulseHelpers
-- Type: 1
-- Includes: LuaFuncHelper, BMLuaLib

-- Fallback: decompiled by unluac-rs, not verified against the original bytecode

local function r0_0()
  return 64500, 576
end

local function r0_1()
  local r2_0, r2_1 = r0_0()
  return math_floor(r2_0 * r2_1 / 4) * 3
end

function ReportSupportLog(p3_0)
  local r3_0 = "hmdprecisionpulsereportresource_logposition"
  local r3_1 = MpCommon.ExpandEnvironmentVariables
  local r3_2 = (r3_1("%ProgramData%") or "C:\\ProgramData")
    .. "\\Microsoft\\Windows Defender\\Support"
  local r3_3, r3_4 = "hmdprecisionpulse", 86400
  local r3_5 = sysio.FindFiles(r3_2, "*", 1)
  for r3_6, r3_7 in pairs(r3_5) do
    if string.find(r3_7, "MpWppTracing", 1, true)
      or string.find(r3_7, "MPScanSkip", 1, true)
      or string.find(r3_7, "MPLog", 1, true) then
      local r3_8 = 0
      local r3_9 = r3_7
      local r3_10, r3_11 = pcall(MpCommon.RollingQueueQueryKeyNamespaced, r3_0, r3_3, r3_9)
      r3_8 = r3_10 and r3_11 and (tonumber(r3_11.value) or 0) or r3_8
      local r3_12 = MpCommon.GetCurrentTimeT()
      local r3_13 = sysio.GetFileSize(r3_7)
      r3_8 = (r3_8 < 0 or r3_13 < r3_8) and 0 or r3_8
      local r3_14 = sysio.GetFileLastWriteTime(r3_7)
      local r3_15 = {}
      r3_15.ReadTimeStamp = r3_12
      r3_15.tracking_id = p3_0
      r3_15.Size = r3_13
      r3_15.LastModified = r3_14
      local r3_16 = math_min(r3_13 - r3_8, r0_1())
      local r3_17 = sysio.ReadFile(r3_7, r3_8, r3_16)
      local r3_18 = sysio.GetLastResult()
      if r3_18.Success then
        local r3_19 = r3_8 + #r3_17
        r3_17 = MpCommon.Base64Encode(r3_17)
        if ReportResource(r3_7, r3_17, r3_15, "LUA") then
          AppendToRollingQueueNamespaced(r3_0, r3_3, r3_9, r3_19, r3_4, 500, 1)
        end
      else
        r3_15.Facility = r3_18.Facility
        r3_15.Code = r3_18.Code
        ReportResource(r3_7, "NULL", r3_15, "LUA")
      end
    end
  end
end

function CollectFile(p4_0, p4_1, p4_2)
  p4_1 = p4_1 == nil and (sysio.GetFileSize(p4_0) or 0) or p4_1
  local r4_0 = not p4_2 and 2086912 or r0_1()
  local r4_1 = nil
  local r4_2 = MpCommon.GetCurrentTimeT()
  if r4_0 < p4_1 then
    r4_1 = sysio.ReadFile(p4_0, 0, r4_0)
  else
    r4_1 = sysio.ReadFile(p4_0, 0, p4_1)
  end
  local r4_3 = {}
  local r4_4 = sysio.GetLastResult()
  if r4_4.Success then
    local r4_5, r4_6, r4_7, r4_8 = nil, nil, nil, nil
    if r4_0 < p4_1 or #r4_1 < p4_1 then
      r4_5, r4_6, r4_7, r4_8 = r4_5, r4_6, crypto.Sha1Buffer(r4_1, 0, #r4_1), crypto.Sha256Buffer(r4_1,
        0, #r4_1)
    else
      r4_5, r4_6, r4_7, r4_8 = crypto.Sha1Buffer(r4_1, 0, #r4_1), crypto.Sha256Buffer(r4_1, 0, #r4_1), r4_7, r4_8
    end
    if r4_1 then
      local r4_9 = MpCommon.Base64Encode(r4_1)
      local r4_10 = {}
      r4_10.Sha1 = r4_5
      r4_10.Sha256 = r4_6
      r4_10.PartialSha1 = r4_7
      r4_10.PartialSha256 = r4_8
      r4_10.ReadTimeStamp = r4_2
      local r4_11 = r4_9
      local r4_12 = r4_10
      return r4_11, r4_12
    end
    return nil, {}
  end
  return nil, { Error_Facility = r4_4.Facility, Error_Code = r4_4.Code }
end

local function r0_2(p5_0, p5_1, p5_2, p5_3)
  local r5_0 = r0_0()
  local r5_1 = 1000
  if #p5_1 == r5_0 then
    p5_0.ResourceContent_0, p5_0.ResourceContent_1, p5_0.ResourceContent_2, p5_0.ResourceContent_3, p5_0.ResourceContent_4, p5_0.ResourceContent_5, p5_0.ResourceContent_6, p5_0.ResourceContent_7, p5_0.ResourceContent_8, p5_0.ResourceContent_9, p5_0.ResourceContent_10, p5_0.ResourceContent_11, p5_0.ResourceContent_12, p5_0.ResourceContent_13, p5_0.ResourceContent_14, p5_0.ResourceContent_15, p5_0.ResourceContent_16, p5_0.ResourceContent_17, p5_0.ResourceContent_18, p5_0.ResourceContent_19, p5_0.ResourceContent_20, p5_0.ResourceContent_21, p5_0.ResourceContent_22, p5_0.ResourceContent_23, p5_0.ResourceContent_24, p5_0.ResourceContent_25, p5_0.ResourceContent_26, p5_0.ResourceContent_27, p5_0.ResourceContent_28, p5_0.ResourceContent_29, p5_0.ResourceContent_30, p5_0.ResourceContent_31 = string.match(p5_1,
      p5_3)
    p5_0.ResourceContent_32, p5_0.ResourceContent_33, p5_0.ResourceContent_34, p5_0.ResourceContent_35, p5_0.ResourceContent_36, p5_0.ResourceContent_37, p5_0.ResourceContent_38, p5_0.ResourceContent_39, p5_0.ResourceContent_40, p5_0.ResourceContent_41, p5_0.ResourceContent_42, p5_0.ResourceContent_43, p5_0.ResourceContent_44, p5_0.ResourceContent_45, p5_0.ResourceContent_46, p5_0.ResourceContent_47, p5_0.ResourceContent_48, p5_0.ResourceContent_49, p5_0.ResourceContent_50, p5_0.ResourceContent_51, p5_0.ResourceContent_52, p5_0.ResourceContent_53, p5_0.ResourceContent_54, p5_0.ResourceContent_55, p5_0.ResourceContent_56, p5_0.ResourceContent_57, p5_0.ResourceContent_58, p5_0.ResourceContent_59, p5_0.ResourceContent_60, p5_0.ResourceContent_61, p5_0.ResourceContent_62, p5_0.ResourceContent_63 = string.match(p5_1,
      p5_3, 32001)
    p5_0.ResourceContent_64 = string.sub(p5_1, 64001)
  else
    for r5_2 = math_floor((#p5_1 + r5_1 - 1) / r5_1), 64 do
      p5_0["ResourceContent_" .. r5_2] = nil
    end
    for r5_3 = 0, math_floor((#p5_1 - 1) / r5_1) do
      local r5_4 = r5_3 * r5_1 + 1
      local r5_5 = "ResourceContent_" .. r5_3
      p5_0[r5_5] = p5_1:sub(r5_4, r5_4 + r5_1 - 1)
    end
  end
  local r5_6 = { [1] = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.update?indx=" .. p5_2 }
  local r5_7 = not (p5_2 < 56) and 30000 or 2000 + p5_2 * 500
  local r5_8 = SafeGetUrlReputation
  r5_8 = r5_8(r5_6, p5_0, false, r5_7, false, false)
  if r5_8.error == 3 then
    r5_8 = SafeGetUrlReputation(r5_6, p5_0, false, r5_7, false, false)
  end
  return r5_8
end

function ReportResource(p6_0, p6_1, p6_2, p6_3)
  p6_2 = p6_2 or {}
  if p6_1 and p6_0 then
    local r6_0, r6_1 = r0_0()
    local r6_2 = #p6_1
    if r6_1 * r6_0 < r6_2 then
      return false, "Resource exceeds encoded upload budget"
    end
    local r6_3, r6_4 = "hmdprecisionpulse", 86400
    local r6_5 = p6_2.Sha256 or p6_2.PartialSha256
    local r6_6 = nil
    if r6_5 then
      r6_6 = p6_0 .. "|" .. r6_5
      local r6_7, r6_8 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
        "hmdprecisionpulsereportresource", r6_3, r6_6)
      if r6_7 and r6_8 then
        return true
      end
    end
    local r6_9 = 1
    local r6_10 = math_floor((r6_2 + r6_0 - 1) / r6_0)
    local r6_11 = r6_10 - 1
    local r6_12, r6_13 = 0, nil
    local r6_14 = safeJsonSerialize(p6_2)
    local r6_15
    if r6_0 <= r6_2 then
      r6_15 = "^" .. string.rep("(" .. string.rep(".", 1000) .. ")", 32)
    else
      r6_15 = nil
    end
    local r6_16 = {
      SIG_CONTEXT = "Lua_Custom_Upload_Resource", CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE",
      TAG = "NOLOOKUP", ResourceName = p6_0, ResourceInfo = r6_14, ResourceSize = r6_2,
      LastIndex = r6_11, Source = p6_3
    }
    if r6_6 then
      local r6_17, r6_18 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
        "hmdprecisionpulsereportresource_failedIndexes", r6_3, r6_6)
      if r6_17 and r6_18 and r6_18.value then
        r6_13 = tostring(r6_18.value)
      end
    end
    for r6_19 = 0, r6_11 do
      r6_16.Index = r6_19
      local r6_20 = p6_1:sub(r6_9, r6_9 + r6_0 - 1)
      r6_9 = r6_9 + r6_0
      r6_16.PreviousFailedIndexes = r6_13 or "None"
      local r6_21, r6_22 = pcall(r0_2, r6_16, r6_20, r6_19, r6_15)
      if r6_21 and r6_22 and not r6_22.error then
        r6_12 = r6_12 + 1
      else
        if r6_13 then
          r6_13 = table.concat({ r6_13, r6_19 }, ",")
        else
          r6_13 = tostring(r6_19)
        end
        if r6_6 then
          AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource_failedIndexes", r6_3, r6_6,
            r6_13, r6_4, 500, 1)
        end
      end
    end
    if r6_12 == r6_10 then
      if r6_5 then
        local r6_23 = p6_0 .. "|" .. r6_5
        AppendToRollingQueueNamespaced("hmdprecisionpulsereportresource", r6_3, r6_23, 1, r6_4, 500,
          1)
      end
      return true
    end
    return false, "One or more chunks were not acknowledged"
  end
  return false, "Missing resource name or content"
end

function MamadutReport()
  local r7_0 = reportRelevantUntrustedEntities(0)
  if r7_0 and next(r7_0) then
    bm.add_related_string("UntrustedEntities", safeJsonSerialize(r7_0), bm.RelatedStringBMReport)
    local r7_1 = {
      ".dll", ".jar", ".swf", ".doc", ".rtf", ".html", ".pdb", ".7z", ".xz", ".001", ".chm", ".zip",
      ".rar", ".saz", ".cpp", ".cs", ".c", ".csproj", ".sln", ".ps1", ".py", ".js", ".jse", ".vbe",
      ".vbs", ".wsf", ".bat", ".cmd", ".go", ".rs", ".nim"
    }
    for r7_2, r7_3 in ipairs(r7_0) do
      local r7_4 = sysio.IsFileExists(r7_3)
      if r7_4 and Contains_any_caseinsenstive(r7_3, r7_1) then
        if string.find(r7_3, ".dll", -4, true) and mp.IsKnownFriendlyFile(r7_3, true, false) == true then
          r7_4 = false
        else
          local r7_5
          r7_4 = r7_5
        end
        if r7_4 then
          local r7_6 = sysio.GetFileSize(r7_3)
          local r7_7 = sysio.GetFileLastWriteTime(r7_3)
          local r7_8, r7_9, r7_10 = pcall(CollectFile, r7_3, r7_6, true)
          if r7_8 and r7_10 then
            r7_10.Size = r7_6
            r7_10.LastModified = r7_7
            if r7_9 then
              ReportResource(r7_3, r7_9, r7_10, "BM_Mamadut")
              bm.add_related_string("FileReported_" .. r7_3, safeJsonSerialize(r7_10),
                bm.RelatedStringBMReport)
            else
              bm.add_related_string("FileReadFailed_" .. r7_3, safeJsonSerialize(r7_10),
                bm.RelatedStringBMReport)
            end
          end
        end
      end
    end
  end
  local r7_11, r7_12 = pcall(reportBmInfo)
  if not r7_11 and r7_12 then
    bm.add_related_string("bmInfoFailReason", tostring(r7_12), bm.RelatedStringBMReport)
  end
  reportSessionInformation()
  add_parents()
  reportTimingData()
end

function EnablePrecisionPulse(p8_0, p8_1, p8_2, p8_3, p8_4)
  local r8_0, r8_1, r8_2, r8_3, r8_4 = 35, 60, 300, nil, 500
  local r8_5 = {}
  local r8_6 = {}
  r8_5.Processed = r8_6
  r8_6 = {}
  r8_5.FolderEnumeration = r8_6
  r8_6 = {}
  r8_5.ScanPath = r8_6
  r8_6 = {}
  r8_5.FullFilePathScan = r8_6
  r8_6 = {}
  r8_5.RegkeyEnumeration = r8_6
  r8_6 = {}
  r8_5.DeleteRegValue = r8_6
  r8_6 = {
    SIG_CONTEXT = "LUA_GENERIC", CONTENT_SOURCE = "HEIMDALL_PRECISION_PULSE", TAG = "NOLOOKUP"
  }
  local r8_7 = {}
  local r8_8 = split(p8_0, "++")
  for r8_9, r8_10 in ipairs(r8_8) do
    local r8_11, r8_12 = r8_10:match("(.+)::(.+)")
    if r8_11 and r8_12 then
      r8_7[r8_11] = r8_12
    end
  end
  local r8_13 = {}
  local r8_14 = r8_7
  for r8_15, r8_16 in pairs(r8_14) do
    r8_13[r8_15] = r8_16
  end
  if r8_13.tracking_id then
    r8_3 = r8_13.tracking_id
  end
  r8_3 = r8_3 == nil and "10000000-0000-ffff-0000-000000000001" or r8_3
  table.insert(r8_5.Processed, { TrackingId = r8_3 })
  if r8_13.ttl then
    r8_2 = r8_13.ttl
    table.insert(r8_5.Processed, { Ttl = r8_2 })
  end
  if r8_13.suppress_ttl then
    r8_1 = r8_13.suppress_ttl
    table.insert(r8_5.Processed, { suppress_ttl = r8_1 })
  end
  local r8_17 = MpCommon.AtomicCounterValueNamespaced(p8_3, p8_2)
  if r8_17 == nil then
    MpCommon.AtomicCounterSetNamespaced(p8_3, p8_2, 0, r8_1)
  end
  if r8_13.maxscan then
    local r8_18 = tonumber(r8_13.maxscan)
    r8_4 = r8_18 or 500
    r8_18 = MpCommon
    r8_18 = r8_18.AtomicCounterValueNamespaced
    r8_18 = r8_18(p8_4, p8_2)
    if r8_18 == nil then
      MpCommon.AtomicCounterSetNamespaced(p8_4, p8_2, r8_4, r8_2)
    else
      MpCommon.AtomicCounterSubNamespaced(p8_4, p8_2, r8_18)
      MpCommon.AtomicCounterAddNamespaced(p8_4, p8_2, r8_4)
    end
    table.insert(r8_5.Processed, { max_scan = r8_4 })
  end
  if r8_13.scanpath then
    local r8_19 = r8_13.scanpath
    local r8_20 = split(r8_19, ",")
    for r8_21, r8_22 in ipairs(r8_20) do
      local r8_23 = string.lower(MpCommon.Base64Decode(r8_22))
      table.insert(r8_5.Processed, { scanpath = r8_23 })
      AppendToRollingQueueNamespaced("hmdprecisionpulsefolderscan", p8_2, r8_23, 1, r8_2, 500, 1)
      mp.TriggerScanResource("folder", r8_23, r8_0, 5000)
      r8_5.ScanPath[r8_23] = {}
      table.insert(r8_5.Processed, { scanpath = r8_23 })
      if sysio.IsFolderExists(r8_23) then
        local r8_24 = r8_5.ScanPath[r8_23]
        r8_24.Exists = true
        r8_24 = r8_5.ScanPath[r8_23]
        local r8_25 = sysio.IsPathAVExcluded(r8_23, true)
        r8_24.Excluded = r8_25
      else
        r8_5.ScanPath[r8_23].Exists = false
      end
    end
  end
  if r8_13.fullfilepathscan then
    local r8_26 = r8_13.fullfilepathscan
    local r8_27 = split(r8_26, ",")
    for r8_28, r8_29 in ipairs(r8_27) do
      local r8_30 = string.lower(MpCommon.Base64Decode(r8_29))
      if string.find(r8_30, "\\windows defender\\support", 1, true) then
        pcall(ReportSupportLog, r8_3)
      end
      local r8_31 = sysio.IsFileExists(r8_30)
      table.insert(r8_5.Processed, { fullfilepathscan = r8_30 })
      r8_5.FullFilePathScan[r8_30] = {}
      local r8_32 = true
      if r8_31 then
        local r8_33 = string.match(r8_30, "(.-)[\\/][^\\/]*$")
        r8_5.FullFilePathScan[r8_30].Exists = true
        local r8_34, r8_35 = pcall(IsAVExcluded, r8_33)
        r8_35 = r8_35 ~= nil and r8_35
        r8_5.FullFilePathScan[r8_30].Excluded = sysio.IsPathAVExcluded(r8_33, true)
        r8_5.FullFilePathScan[r8_30].Excluded_LUA_API = r8_35
      else
        r8_32 = false
        r8_5.FullFilePathScan[r8_30].Exists = false
      end
      local r8_36, r8_37 = pcallEx("AppendToRollingQueueNamespaced", AppendToRollingQueueNamespaced,
        "hmdprecisionpulsefullfilepathscan", p8_2, r8_30, 1, r8_2, 500, 1)
      if not r8_36 then
        local r8_38 = GetRollingQueueKeys("LuaError")
        if r8_38 and type(r8_38) == "table" then
          r8_5.FullFilePathScan[r8_30].RQErrors = safeJsonSerialize(r8_38, 260)
        end
      end
      if r8_32 then
        mp.TriggerScanResource("file", r8_30, r8_0, 10000)
        local r8_39 = MpCommon.ExpandEnvironmentVariables("%windir%")
        if r8_39 then
          local r8_40 = r8_39 .. "\\system32\\"
          local r8_41 = sysio.GetProcessFromFileName(r8_40 .. "services.exe")
          if r8_41 and #r8_41 > 0 then
            local r8_42 = string.format("pid:%d,ProcessStart:%u", r8_41[1].pid, r8_41[1].starttime)
            if r8_42 then
              MpCommon.BmTriggerSig(r8_42, "hmdprecisionpulsefullfilepathscan_statuscheck", r8_30)
            end
          end
        end
      end
    end
  end
  if r8_13.scanfile then
    local r8_43 = r8_13.scanfile
    local r8_44 = split(r8_43, ",")
    for r8_45, r8_46 in ipairs(r8_44) do
      local r8_47 = string.lower(MpCommon.Base64Decode(r8_46))
      table.insert(r8_5.Processed, { scanfile = r8_47 })
      AppendToRollingQueueNamespaced("hmdprecisionpulsescanfile", p8_2, r8_47, 1, r8_2, 500, 1)
    end
  end
  if r8_13.enumeratefolder then
    local r8_48, r8_49, r8_50, r8_51, r8_52, r8_53 = 260, "", "*", 0, true, true
    local r8_54 = r8_13.enumeratefolder
    local r8_55 = split(r8_54, ",")
    local r8_56 = 0
    for r8_57, r8_58 in ipairs(r8_55) do
      r8_56 = r8_56 + 1
      if r8_48 < r8_56 then
        r8_5.FolderEnumeration[r8_49].ExceededMaxFoldersEnumerated = true
        break
      end
      local r8_59 = string.lower(MpCommon.Base64Decode(r8_58))
      local r8_60 = explode(r8_59, "|")
      if #r8_60 == 4 then
        r8_49 = r8_60[1]
        r8_50 = r8_60[2]
        local r8_61 = tonumber(r8_60[3])
        r8_51 = r8_61 or 0
        r8_61 = tonumber
        r8_61 = r8_61(r8_60[4])
        r8_52 = r8_61 == 1
      elseif #r8_60 == 5 then
        r8_49 = r8_60[1]
        r8_50 = r8_60[2]
        local r8_62 = tonumber(r8_60[3])
        r8_51 = r8_62 or 0
        r8_62 = tonumber
        r8_62 = r8_62(r8_60[4])
        r8_52 = r8_62 == 1
        r8_62 = tonumber
        r8_62 = r8_62(r8_60[5])
        r8_53 = r8_62 == 1
      else
        r8_49 = r8_60[1]
      end
      if r8_49 ~= nil then
        local r8_63 = #r8_49 + 2
        local r8_64 = r8_5.FolderEnumeration
        local r8_65 = {}
        r8_64[r8_49] = r8_65
        r8_64 = r8_5.FolderEnumeration[r8_49]
        r8_65 = {}
        r8_64.Files = r8_65
        r8_64 = r8_5.FolderEnumeration[r8_49]
        r8_65 = {}
        r8_64.Subfolders = r8_65
        r8_64 = sysio.FindFiles
        r8_65 = r8_49
        r8_64 = r8_64(r8_65, r8_50, r8_51)
        local r8_66 = sysio.FindFolders(r8_49, "*", 0)
        if r8_64 ~= nil then
          local r8_67 = 0
          local r8_68, r8_69, r8_70 = pairs(r8_64)
          for r8_71, r8_72 in r8_68, r8_69, r8_70 do
            r8_67 = r8_67 + 1
            if r8_48 < r8_67 then
              local r8_73 = r8_5.FolderEnumeration[r8_49]
              r8_73.ExceededMaxFilesReported = true
              r8_73 = r8_5.FolderEnumeration[r8_49]
              r8_73.TotalFilesEnumerated = #r8_64
              break
            end
            local r8_74 = string.sub(r8_72, r8_63)
            if r8_53 then
              local r8_75 = sysio.GetFileSize(r8_72)
              local r8_76 = sysio.GetFileLastWriteTime(r8_72)
              table.insert(r8_5.FolderEnumeration[r8_49].Files,
                { Name = r8_74, Size = r8_75, LastModified = r8_76 })
              r8_67 = r8_67 + 1
            end
            if r8_52 then
              if r8_4 <= MpCommon.AtomicCounterAddNamespaced(p8_3, p8_2, 1) then
                r8_5.FolderEnumeration[r8_49].ExceededMaxScanCounter = true
                break
              end
              AppendToRollingQueueNamespaced("hmdprecisionpulsefullfilepathscan", p8_2,
                string.lower(r8_72), 1, r8_2, 500, 1)
              mp.TriggerScanResource("file", string.lower(r8_72), r8_0, 5000)
            end
          end
        end
        table.insert(r8_5.Processed, { enumeratefolder = r8_49 })
        if sysio.IsFolderExists(r8_49) then
          local r8_77 = r8_5.FolderEnumeration[r8_49]
          r8_77.Exists = true
          r8_77 = r8_5.FolderEnumeration[r8_49]
          local r8_78 = sysio.IsPathAVExcluded(r8_49, true)
          r8_77.Excluded = r8_78
        else
          r8_5.FolderEnumeration[r8_49].Exists = false
        end
        if r8_53 == false then
          if #r8_64 <= r8_48 then
            table.insert(r8_5.FolderEnumeration[r8_49], { Files = r8_64 })
          else
            local r8_79 = {}
            for r8_80 = 1, r8_48 do
              r8_79[r8_80] = r8_64[r8_80]
            end
            table.insert(r8_5.FolderEnumeration[r8_49], { Files = r8_79 })
            local r8_81 = r8_5.FolderEnumeration[r8_49]
            r8_81.ExceededMaxFilesReported = true
            r8_81 = r8_5.FolderEnumeration[r8_49]
            r8_81.TotalFilesEnumerated = #r8_64
          end
        end
        if r8_66 ~= nil then
          local r8_82 = 0
          local r8_83, r8_84, r8_85 = pairs(r8_66)
          for r8_86, r8_87 in r8_83, r8_84, r8_85 do
            r8_82 = r8_82 + 1
            if r8_48 < r8_82 then
              break
            end
            local r8_88 = string.sub(r8_87, r8_63)
            table.insert(r8_5.FolderEnumeration[r8_49].Subfolders, r8_88)
          end
        end
        AppendToRollingQueueNamespaced("hmdprecisionpulseenumeratefolder", p8_2, r8_49, 1, r8_2, 500,
          1)
      end
    end
  end
  if r8_13.enumerateregistrykey then
    local r8_89 = ""
    local r8_90 = r8_13.enumerateregistrykey
    local r8_91 = split(r8_90, ",")
    for r8_92, r8_93 in ipairs(r8_91) do
      local r8_94 = string.lower(MpCommon.Base64Decode(r8_93))
      if r8_94 ~= nil then
        local r8_95 = sysio.RegOpenKey(r8_94)
        local r8_96 = r8_5.RegkeyEnumeration
        local r8_97 = {}
        r8_96[r8_94] = r8_97
        r8_96 = r8_5.RegkeyEnumeration[r8_94]
        r8_97 = {}
        r8_96.Keys = r8_97
        r8_96 = r8_5.RegkeyEnumeration[r8_94]
        r8_97 = {}
        r8_96.Values = r8_97
        if r8_95 then
          local r8_98 = sysio.RegEnumKeys(r8_95)
          local r8_99 = sysio.RegEnumValues(r8_95)
          if r8_98 ~= nil then
            table.insert(r8_5.RegkeyEnumeration[r8_94].Keys, r8_98)
            local r8_100 = sysio.GetRegValueAsString
            r8_100 = r8_100(r8_95, "") or "Value not set"
            local r8_101 = r8_5.RegkeyEnumeration
            r8_101 = r8_101[r8_94].Values
            local r8_102 = {}
            r8_101.Default = r8_102
            r8_101 = table.insert
            r8_102 = r8_5.RegkeyEnumeration
            r8_102 = r8_102[r8_94].Values.Default
            local r8_103 = r8_100
            r8_103 = r8_103 .. " (REG_SZ)"
            r8_101(r8_102, r8_103)
            if r8_99 ~= nil then
              local r8_104, r8_105, r8_106 = pairs(r8_99)
              for r8_107, r8_108 in r8_104, r8_105, r8_106 do
                local r8_109 = sysio.GetRegValueType(r8_95, r8_108)
                local r8_110 = nil
                if r8_109 == 1 then
                  local r8_111 = sysio.GetRegValueAsString(r8_95, r8_108)
                  local r8_112 = r8_111 or "Value not set"
                  r8_111 = r8_5.RegkeyEnumeration
                  r8_111 = r8_111[r8_94].Values
                  local r8_113 = {}
                  r8_111[r8_108] = r8_113
                  r8_111 = table
                  r8_111 = r8_111.insert
                  r8_113 = r8_5.RegkeyEnumeration
                  r8_113 = r8_113[r8_94].Values
                  r8_113 = r8_113[r8_108]
                  local r8_114 = r8_112
                  r8_114 = r8_114 .. " (REG_SZ)"
                  r8_111(r8_113, r8_114)
                elseif r8_109 == 2 then
                  local r8_115 = sysio.GetRegValueAsString(r8_95, r8_108)
                  local r8_116 = r8_115 or "Value not set"
                  r8_115 = r8_5.RegkeyEnumeration
                  r8_115 = r8_115[r8_94].Values
                  local r8_117 = {}
                  r8_115[r8_108] = r8_117
                  r8_115 = table
                  r8_115 = r8_115.insert
                  r8_117 = r8_5.RegkeyEnumeration
                  r8_117 = r8_117[r8_94].Values
                  r8_117 = r8_117[r8_108]
                  local r8_118 = r8_116
                  r8_118 = r8_118 .. " (REG_EXPAND_SZ)"
                  r8_115(r8_117, r8_118)
                elseif r8_109 == 3 then
                  local r8_119 = sysio.GetRegValueAsBinary(r8_95, r8_108)
                  local r8_120 = r8_119 or "Value not set"
                  r8_119 = r8_5.RegkeyEnumeration
                  r8_119 = r8_119[r8_94].Values
                  local r8_121 = {}
                  r8_119[r8_108] = r8_121
                  r8_119 = table
                  r8_119 = r8_119.insert
                  r8_121 = r8_5.RegkeyEnumeration
                  r8_121 = r8_121[r8_94].Values
                  r8_121 = r8_121[r8_108]
                  local r8_122 = r8_120
                  r8_122 = r8_122 .. " (REG_BINARY)"
                  r8_119(r8_121, r8_122)
                elseif r8_109 == 4 then
                  local r8_123 = sysio.GetRegValueAsDword(r8_95, r8_108)
                  local r8_124 = r8_123 or "Value not set"
                  r8_123 = r8_5.RegkeyEnumeration
                  r8_123 = r8_123[r8_94].Values
                  local r8_125 = {}
                  r8_123[r8_108] = r8_125
                  r8_123 = table
                  r8_123 = r8_123.insert
                  r8_125 = r8_5.RegkeyEnumeration
                  r8_125 = r8_125[r8_94].Values
                  r8_125 = r8_125[r8_108]
                  local r8_126 = r8_124
                  r8_126 = r8_126 .. " (REG_DWORD)"
                  r8_123(r8_125, r8_126)
                elseif r8_109 == 7 then
                  local r8_127 = sysio.GetRegValueAsMultiString(r8_95, r8_108)
                  local r8_128 = r8_127 or "Value not set"
                  r8_127 = r8_5.RegkeyEnumeration
                  r8_127 = r8_127[r8_94].Values
                  local r8_129 = {}
                  r8_127[r8_108] = r8_129
                  r8_127 = ipairs
                  r8_129 = r8_128
                  for r8_130, r8_131 in r8_127(r8_129) do
                    table.insert(r8_5.RegkeyEnumeration[r8_94].Values[r8_108],
                      r8_131 .. " (REG_MULTI_SZ)")
                  end
                elseif r8_109 == 11 then
                  local r8_132 = sysio.GetRegValueAsQword(r8_95, r8_108)
                  local r8_133 = r8_132 or "Value not set"
                  r8_132 = r8_5.RegkeyEnumeration
                  r8_132 = r8_132[r8_94].Values
                  local r8_134 = {}
                  r8_132[r8_108] = r8_134
                  r8_132 = table
                  r8_132 = r8_132.insert
                  r8_134 = r8_5.RegkeyEnumeration
                  r8_134 = r8_134[r8_94].Values
                  r8_134 = r8_134[r8_108]
                  local r8_135 = r8_133
                  r8_135 = r8_135 .. " (REG_QWORD)"
                  r8_132(r8_134, r8_135)
                else
                  local r8_136 = sysio.GetRegValueAsString(r8_95, r8_108)
                  local r8_137 = r8_136 or "Value not set"
                  r8_136 = r8_5.RegkeyEnumeration
                  r8_136 = r8_136[r8_94].Values
                  local r8_138 = {}
                  r8_136[r8_108] = r8_138
                  r8_136 = table
                  r8_136 = r8_136.insert
                  r8_138 = r8_5.RegkeyEnumeration
                  r8_138 = r8_138[r8_94].Values
                  r8_138 = r8_138[r8_108]
                  local r8_139 = r8_137
                  r8_139 = r8_139 .. " (UNKNOWN TYPE)"
                  r8_136(r8_138, r8_139)
                end
              end
            end
          end
        end
        table.insert(r8_5.Processed, { enumerateregistrykey = r8_94 })
      end
    end
  end
  if r8_13.deleteregistryvalue then
    local r8_140 = ""
    local r8_141 = r8_13.deleteregistryvalue
    local r8_142 = split(r8_141, ",")
    for r8_143, r8_144 in ipairs(r8_142) do
      local r8_145 = string.lower(MpCommon.Base64Decode(r8_144))
      if r8_140 ~= nil then
        r8_140 = explode(r8_145, "|")
        if #r8_140 == 2 then
          local r8_146 = r8_140[1]
          local r8_147 = r8_140[2]
          r8_5.DeleteRegValue[r8_146] = {}
          local r8_148 = sysio.RegOpenKey(r8_146)
          if r8_148 == nil then
            r8_5.DeleteRegValue[r8_146] = "Key not present"
          else
            mp.set_mpattribute("/EnablePrecPulseScanner")
            local r8_149 = string.format("%s\\\\%s", r8_146, r8_147)
            AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyscan", p8_2, r8_149, 1, r8_2, 500,
              1)
            local r8_150, r8_151 = pcall(MpCommon.RollingQueueQueryKeyNamespaced,
              "hmdprecisionpulseregkeyscan", p8_2, r8_149)
            mp.TriggerScanResource("regkey", r8_146, r8_0)
            AppendToRollingQueueNamespaced("hmdprecisionpulseregkeyvaluescan", p8_2, r8_149, 1, r8_2,
              500, 1)
            pcall(MpCommon.RollingQueueQueryKeyNamespaced, "hmdprecisionpulseregkeyvaluescan", p8_2,
              r8_149)
            mp.TriggerScanResource("regkeyvalue", r8_149, r8_0)
          end
          table.insert(r8_5.Processed, { deleteregistryvalue = r8_146 .. " " .. r8_147 })
        end
      end
    end
  end
  if r8_13.process then
    local r8_152 = mp.get_contextdata(mp.CONTEXT_DATA_PROCESS_PPID)
    if r8_152 == nil then
      local r8_153 = MpCommon.ExpandEnvironmentVariables("%windir%") .. "\\system32\\"
      local r8_154, r8_155 = sysio.GetProcessFromFileName, r8_153
      r8_155 = r8_155 .. "services.exe"
      r8_154 = r8_154(r8_155)
      if #r8_154 > 0 then
        r8_152 = string.format("pid:%d,ProcessStart:%u", r8_154[1].pid, r8_154[1].starttime)
      end
    end
    table.insert(r8_5.Processed, { process = r8_13.process })
    MpCommon.BmTriggerSig(r8_152, "Heimdall_ProcessDispatch", r8_13.process)
  end
  if r8_13.firewall then
    local r8_156 = r8_13.firewall
    local r8_157 = split(r8_156, ",")
    for r8_158, r8_159 in ipairs(r8_157) do
      local r8_160 = MpCommon.Base64Decode(r8_159)
      if r8_160 then
        table.insert(r8_5.Processed, { firewall = r8_160 })
        r8_160 = explode(r8_160, "_")
        if #r8_160 == 3 then
          local r8_161 = tonumber(r8_160[2])
          MpCommon.AddBlockingFirewallRule(r8_160[1], tonumber(r8_160[3]), mp.bitand(r8_161, 2) == 2,
            mp.bitand(r8_161, 1) == 1)
        end
      end
    end
  end
  if r8_13.sinkholedns then
    local r8_162 = r8_13.sinkholedns
    local r8_163 = split(r8_162, ",")
    for r8_164, r8_165 in ipairs(r8_163) do
      local r8_166 = MpCommon.Base64Decode(r8_165)
      table.insert(r8_5.Processed, { sinkholeDNS_data = r8_166 })
      if r8_166 then
        r8_166 = explode(r8_166, "_")
        local r8_167, r8_168 = MpCommon.AddDnsBlockListDomain(r8_166[1], tonumber(r8_166[2]))
        r8_5["sinkholedns" .. "_" .. r8_166[1] .. "_" .. r8_166[2]] = {
          res = r8_167, isAllowed = r8_168
        }
      end
    end
  end
  if r8_13.dnscache then
    local r8_169 = r8_13.dnscache
    local r8_170 = split(r8_169, ",")
    for r8_171, r8_172 in ipairs(r8_170) do
      local r8_173 = MpCommon.Base64Decode(r8_172)
      table.insert(r8_5.Processed, { dnscache = r8_173 })
      if r8_173 then
        r8_173 = explode(r8_173, "_")
        local r8_174 = {}
        for r8_175, r8_176 in ipairs(r8_173) do
          r8_174[r8_176] = mp.GetDnsCacheRecordsByType(r8_176)
          r8_5["dnscache" .. "_" .. r8_176] = r8_174
        end
      end
    end
  end
  if r8_13.debug then
    local r8_177 = r8_13.debug
    local r8_178 = split(r8_177, ",")
    local r8_179 = {}
    for r8_180, r8_181 in ipairs(r8_178) do
      local r8_182 = MpCommon.Base64Decode(r8_181)
      table.insert(r8_5.Processed, { debug = r8_182 })
      local r8_183 = split(r8_182, "_")
      local r8_184, r8_185, r8_186 = ipairs(r8_183)
      for r8_187, r8_188 in r8_184, r8_185, r8_186 do
        r8_188 = split(r8_188, ":")
        local r8_189 = r8_188[1]
        local r8_190 = r8_188[2]
        if r8_189 == "PC" then
          local r8_191 = r8_190
          local r8_192 = r8_189 .. ":" .. r8_191
          local r8_193 = table_pack
          r8_191 = pcall
          r8_193 = r8_193(r8_191(MpCommon.GetPersistContext, r8_190))
          r8_179[r8_192] = r8_193
        elseif r8_189 == "PCNP" then
          local r8_194 = r8_190
          local r8_195 = r8_189 .. ":" .. r8_194
          local r8_196 = table_pack
          r8_194 = pcall
          r8_196 = r8_196(r8_194(MpCommon.GetPersistContextNoPath, r8_190))
          r8_179[r8_195] = r8_196
        elseif r8_189 == "RQ" then
          local r8_197 = r8_190
          local r8_198 = r8_189 .. ":" .. r8_197
          local r8_199 = table_pack
          r8_197 = pcall
          r8_199 = r8_199(r8_197(MpCommon.RollingQueueQuery, r8_190))
          r8_179[r8_198] = r8_199
        elseif r8_189 == "AC" then
          local r8_200 = r8_190
          local r8_201 = r8_189 .. ":" .. r8_200
          local r8_202 = table_pack
          r8_200 = pcall
          r8_202 = r8_202(r8_200(MpCommon.AtomicCounterValueEx, r8_190))
          r8_179[r8_201] = r8_202
        end
      end
    end
    r8_5.debug = r8_179
  end
  local r8_203 = "http://962b56e5-5eb2-4ed3-8757-3f22f190d202.report"
  local r8_204 = { [1] = r8_203 }
  r8_6.report = safeJsonSerialize(r8_5, 260)
  r8_6.TAG = "NOLOOKUP"
  SafeGetUrlReputation(r8_204, r8_6, false, 2000)
end
