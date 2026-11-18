-- Threat: !InfrastructureShared
-- Name: RmmImageAgeTelemetryInfra
-- Type: 1
-- Includes: HIPSRmmToolInfra

local function l_0_0(l_1_0)
  return type(l_1_0) == "number" and 0 <= l_1_0 and l_1_0 < 9007199254740992 and l_1_0 % 1 == 0
end

local function l_0_1(l_2_0)
  if type(l_2_0) ~= "string" or l_2_0 == "" or l_2_0:find("\000", 1, true) or l_2_0:find("|", 1, true) then
    return nil
  end
  l_2_0 = MpCommon.PathToWin32Path(l_2_0)
  if not (type(l_2_0) == "string" and l_2_0:match("^[a-zA-Z]:\\")) or l_2_0:find("->", 1, true) then
    return nil
  end
  return string.lower(l_2_0)
end

local function l_0_2(l_3_0)
  return "RmmImageCreation_v1:" .. crypto.Sha1Buffer(l_3_0, 0, #l_3_0)
end

local function l_0_3(l_4_0)
  local l_4_1 = MpCommon.GetPersistContextNoPath(l_4_0)
  if type(l_4_1) ~= "table" or type(l_4_1[1]) ~= "string" or l_4_1[2] ~= nil then
    return nil
  end
  return l_4_1[1]
end

local function l_0_4(l_5_0, l_5_1, l_5_2)
  MpCommon.OverwritePersistContextNoPath(l_5_0, {l_5_1}, l_5_2)
  if l_0_3(l_5_0) ~= l_5_1 then
    mp.set_mpattribute("MpInternal_researchdata=RmmImageAgeCacheStatus=SnapshotWriteFailed")
    return false
  end
  return true
end

local function l_0_5(l_6_0)
  if IsRmmToolFilePath(l_6_0) then
    return "Path"
  end
  if IsRmmToolVersionInfo(l_6_0) then
    return "Version"
  end
  if IsRmmToolOFN(l_6_0) then
    return "OFN"
  end
  return nil
end

local function l_0_6(l_7_0)
  if not l_0_0(l_7_0) then
    return nil
  end
  local l_7_1 = {
    60,
    300,
    600,
    1200,
    1800,
    3600,
    14400,
    28800,
    43200,
    86400,
    172800,
    259200,
    604800,
    1209600,
    1814400,
    2419200
  }
  for l_7_2, l_7_3 in ipairs(l_7_1) do
    if l_7_0 < l_7_3 then
      return l_7_2
    end
  end
  return nil
end

function Infrastructure_CacheRmmImageCreation()
  local l_8_0 = l_0_1(mp.getfilename(mp.FILEPATH_QUERY_FULL))
  if not l_8_0 then
    return false
  end
  local l_8_1 = l_0_2(l_8_0)
  local l_8_2 = l_0_3(l_8_1)
  if not l_0_5(l_8_0) then
    if l_8_2 ~= nil then
      l_0_4(l_8_1, "invalid", 60)
    end
    return false
  end
  mp.set_mpattribute("MpDisableCaching")
  local l_8_3 = mp.get_contextdata(mp.CONTEXT_DATA_FILE_AGE)
  local l_8_4 = MpCommon.GetCurrentTimeT()
  local l_8_5 = sysio.GetFileLastWriteTime(l_8_0)
  local l_8_6 = sysio.GetFileSize(l_8_0)
  if not (l_0_0(l_8_3) and l_0_0(l_8_4)) or l_8_3 >= l_8_4 or type(l_8_5) ~= "number" or l_8_5 - l_8_5 ~= 0 or l_8_5 <= 0 or l_8_5 % 1 ~= 0 or not l_0_0(l_8_6) then
    l_0_4(l_8_1, "invalid", 60)
    mp.set_mpattribute("MpInternal_researchdata=RmmImageAgeCacheStatus=InvalidMetadata")
    return false
  end
  local l_8_7 = 2419200 - l_8_3
  if l_8_7 <= 0 then
    l_0_4(l_8_1, "invalid", 60)
    return false
  end
  local l_8_8 = string.format("%.0f:%.0f:%s:%.0f", l_8_4 - l_8_3, l_8_4, tostring(l_8_5), l_8_6)
  return l_0_4(l_8_1, l_8_8, l_8_7)
end

local function l_0_7(l_9_0)
  local l_9_1 = l_9_0:lower():match("%.([^\\%.]+)$")
  if l_9_1 == "dll" or l_9_1 == "pyd" then
    return false
  end
  local l_9_2 = sysio.GetFileAttributes(l_9_0)
  if type(l_9_2) == "number" and mp.bitand(l_9_2, 16) ~= 0 then
    return false
  end
  local l_9_3 = {
    bat = true,
    cmd = true,
    ps1 = true,
    psm1 = true,
    psd1 = true,
    vbs = true,
    vbe = true,
    js = true,
    jse = true,
    wsf = true,
    wsh = true,
    hta = true,
    py = true,
    pyw = true,
    pyc = true,
    sh = true,
    pl = true,
    rb = true,
    lua = true,
    tcl = true,
    r = true,
    groovy = true,
    mjs = true,
    cjs = true,
    php = true,
    asp = true,
    aspx = true,
    ashx = true,
    jsp = true
  }
  if l_9_3[l_9_1] then
    return true
  end
  local l_9_4 = sysio.ReadPEHeader(l_9_0)
  if type(l_9_4) == "table" and type(l_9_4.Characteristics) == "number" then
    return mp.bitand(l_9_4.Characteristics, 8194) == 2
  end
  return l_9_1 == "exe" or l_9_1 == "com" or l_9_1 == "scr" or l_9_1 == "pif"
end

local function l_0_8(l_10_0)
  bm.add_related_string("RmmImageAgeStatus", l_10_0, bm.RelatedStringBMReport)
end

local function l_0_9(l_11_0, l_11_1)
  if l_11_0 ~= "ProcessLaunch" and l_11_0 ~= "FileCreate" then
    l_0_8("InvalidActivityKind")
    return nil
  end
  if not l_11_1.matched or type(l_11_1.utf8p1) ~= "string" or l_11_1.utf8p1 == "" or l_11_1.utf8p1:find("|", 1, true) or l_11_1.utf8p1:find("\000", 1, true) then
    l_0_8("InvalidActivity")
    return nil
  end
  local l_11_2 = l_11_1.timestamp
  if type(l_11_2) ~= "number" or l_11_2 - l_11_2 ~= 0 or l_11_2 % 1 ~= 0 or l_11_2 < 116444736000000000 then
    l_0_8("InvalidEventTime")
    return nil
  end
  local l_11_3 = l_11_2 / 10000000
  local l_11_4 = l_11_3 - l_11_3 % 1 - 11644473600
  local l_11_5 = MpCommon.GetCurrentTimeT()
  if not l_0_0(l_11_5) or l_11_4 <= 0 or l_11_4 > l_11_5 then
    l_0_8("InvalidEventTime")
    return nil
  end
  local l_11_6 = bm.get_current_process_startup_info()
  if type(l_11_6) ~= "table" or type(l_11_6.ppid) ~= "string" or l_11_6.ppid == "" then
    l_0_8("InitiatorUnavailable")
    return nil
  end
  local l_11_7 = l_11_6.ppid
  local l_11_8 = "RmmImageAgeEvent_v1"
  local l_11_9 = l_11_0 .. "|" .. string.format("%.0f", l_11_2) .. "|" .. l_11_1.utf8p1:lower() .. "|"
  local l_11_10 = MpCommon.GetProcessAttributeValue(l_11_7, l_11_8)
  if type(l_11_10) == "string" and l_11_10:sub(1, #l_11_9) == l_11_9 then
    local l_11_11, l_11_12, l_11_13, l_11_14, l_11_15, l_11_16 = l_11_10:sub(#l_11_9 + 1):match("^(%d+)|(%d+)|(%d+)|(%d+)|([^|]+)|(.+)$")
    l_11_11, l_11_12, l_11_13, l_11_14 = tonumber(l_11_11), tonumber(l_11_12), tonumber(l_11_13), tonumber(l_11_14)
    if l_11_11 == 0 then
      return nil
    end
    if l_11_11 and l_0_6(l_11_12) == l_11_11 and l_11_13 == l_11_4 - l_11_12 and l_11_14 and l_11_14 <= 3 and l_11_16 ~= "-" then
      return {
        bucket = l_11_11,
        age = l_11_12,
        created = l_11_13,
        hops = l_11_14,
        signal = l_11_15,
        path = l_11_16
      }
    end
    l_0_8("InvalidEventMemo")
    return nil
  end
  
  local function l_11_17(l_12_0)
    local l_12_1 = "0|0|0|0|None|-"
    if l_12_0 then
      l_12_1 = string.format("%d|%.0f|%.0f|%d|%s|%s", l_12_0.bucket, l_12_0.age, l_12_0.created, l_12_0.hops, l_12_0.signal, l_12_0.path)
    end
    local l_12_2 = pcall(MpCommon.AddProcessAttribute, l_11_7, l_11_8, l_11_9 .. l_12_1, false)
    if not l_12_2 then
      l_0_8("EventMemoWriteFailed")
    end
    return l_12_0
  end
  
  if l_11_0 == "FileCreate" and not l_0_7(l_11_1.utf8p1) then
    return l_11_17(nil)
  end
  local l_11_18 = l_11_7
  local l_11_19 = l_0_1(bm.get_imagepath())
  local l_11_20 = {}
  for l_11_21 = 0, 3 do
    if type(l_11_18) ~= "string" or l_11_18 == "" or not l_11_19 then
      l_0_8("AncestryUnavailable")
      return l_11_17(nil)
    end
    if l_11_20[l_11_18] then
      l_0_8("AncestryCycle")
      return l_11_17(nil)
    end
    l_11_20[l_11_18] = true
    local l_11_22 = l_0_5(l_11_19)
    if l_11_22 then
      local l_11_23 = l_0_3(l_0_2(l_11_19))
      local l_11_24, l_11_25, l_11_26, l_11_27
      if type(l_11_23) == "string" then
        l_11_24, l_11_25, l_11_26, l_11_27 = l_11_23:match("^(%d+):(%d+):([^:]+):(%d+)$")
        l_11_24, l_11_25, l_11_27 = tonumber(l_11_24), tonumber(l_11_25), tonumber(l_11_27)
      end
      local l_11_28 = tonumber(l_11_26)
      if not (l_11_24 and not (l_11_24 <= 0) and l_11_25 and not (l_11_25 < l_11_24) and l_11_28) or l_11_28 <= 0 or l_11_28 - l_11_28 ~= 0 or not l_11_27 then
        l_0_8("CreationSnapshotInvalid")
        return l_11_17(nil)
      end
      if l_11_4 < l_11_25 then
        l_0_8("CreationSnapshotAfterEvent")
        return l_11_17(nil)
      end
      if tostring(sysio.GetFileLastWriteTime(l_11_19)) ~= l_11_26 then
        l_0_8("CreationLastWriteChanged")
        return l_11_17(nil)
      end
      if sysio.GetFileSize(l_11_19) ~= l_11_27 then
        l_0_8("CreationSizeChanged")
        return l_11_17(nil)
      end
      local l_11_29 = l_11_4 - l_11_24
      local l_11_30 = l_0_6(l_11_29)
      if not l_11_30 then
        return l_11_17(nil)
      end
      return l_11_17({
        bucket = l_11_30,
        age = l_11_29,
        created = l_11_24,
        hops = l_11_21,
        signal = l_11_22,
        path = l_11_19
      })
    end
    if l_11_21 < 3 then
      local l_11_31 = mp.GetParentProcInfo(l_11_18)
      if type(l_11_31) ~= "table" then
        l_0_8("AncestryUnavailable")
        return l_11_17(nil)
      end
      l_11_18 = l_11_31.ppid
      l_11_19 = l_0_1(l_11_31.image_path)
    end
  end
  return l_11_17(nil)
end

function Infrastructure_ReportRmmImageAgeActivity(l_13_0, l_13_1, l_13_2)
  if not (type(l_13_2) == "table" and l_0_0(l_13_1)) or l_13_1 < 1 or 16 < l_13_1 then
    l_0_8("InvalidReportInput")
    return mp.CLEAN
  end
  local l_13_3 = l_0_9(l_13_0, l_13_2)
  if not l_13_3 or l_13_3.bucket ~= l_13_1 then
    return mp.CLEAN
  end
  local l_13_4 = crypto.Sha1Buffer(l_13_3.path, 0, #l_13_3.path)
  local l_13_5 = string.format("%s|%.0f|%.0f|%d|%s|%s", l_13_0, l_13_3.age, l_13_3.created, l_13_3.hops, l_13_3.signal, l_13_4)
  bm.add_related_string("RmmImageAgeMetadata", l_13_5, bm.RelatedStringBMReport)
  return mp.INFECTED
end
