-- Threat: !InfrastructureShared
-- Name: !#TEL:Trojan:Win32/EdrTactToAsrSig1
-- Type: 32
-- MpAttributes: RPF:TopLevelFile

local function l_0_0(l_1_0, l_1_1)
  if l_1_0 == nil or l_1_0 == "" then
    return false
  end
  if l_1_1 == nil or l_1_1 == "" then
    return false
  end
  for l_1_2, l_1_3 in ipairs(l_1_1) do
    if string.find(l_1_0, l_1_3, 1, true) ~= nil then
      return true
    end
  end
  return false
end

local function l_0_1(l_2_0, l_2_1)
  if l_2_0 == nil or l_2_0 == "" then
    return 0
  end
  if l_2_1 == nil or l_2_1 == "" then
    return 0
  end
  local l_2_2 = 0
  for l_2_3 in string.gmatch(l_2_0, l_2_1) do
    l_2_2 = l_2_2 + 1
  end
  return l_2_2
end

local l_0_2 = mp.GetScanSource()
if l_0_2 ~= mp.SCANSOURCE_IOAV_WEB and l_0_2 ~= mp.SCANSOURCE_IOAV_FILE and l_0_2 ~= mp.SCANSOURCE_RTP then
  return mp.CLEAN
end
local l_0_3 = mp.getfilename(mp.FILEPATH_QUERY_FULL)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = MpCommon.PathToWin32Path(l_0_3)
if l_0_3 == nil or l_0_3 == "" then
  return mp.CLEAN
end
l_0_3 = string.lower(l_0_3)
local l_0_4 = mp.get_contextdata(mp.CONTEXT_DATA_FILENAME)
if l_0_4 == nil or l_0_4 == "" then
  l_0_4 = string.match(l_0_3, "\\([^\\]+)$")
  if l_0_4 == nil or l_0_4 == "" then
    return mp.CLEAN
  end
end
l_0_4 = string.lower(l_0_4)
local l_0_5 = {
  ".rar",
  ".zip",
  ".gz",
  ".msi",
  ".cab"
}
if not l_0_0(l_0_4, l_0_5) then
  return mp.CLEAN
end
local l_0_6 = MpCommon.PathToWin32Path(mp.get_contextdata(mp.CONTEXT_DATA_FILEPATH))
if l_0_6 == nil or l_0_6 == "" then
  l_0_6 = string.match(l_0_3, "(.+)\\[^\\]+$")
  if l_0_6 == nil or l_0_6 == "" then
    return mp.CLEAN
  end
end
l_0_6 = string.lower(l_0_6)
if string.find(l_0_6, "\\downloads$") == nil then
  return mp.CLEAN
end
local l_0_7 = {
  "intervals.icu"
}
local l_0_8 = {
  "motorcycles/",
  "makeup/",
  "boats/",
  "icu/",
  "rest/",
  "christmas/",
  "yachts/",
  "mom/",
  "hair/",
  "cyou/",
  "lat/",
  "lol/",
  "pics/",
  "beauty/",
  "monster/",
  "cfd/",
  "autos/",
  "buzz/",
  "bond/",
  "homes/",
  "skin/"
}
local l_0_9 = mp.IOAVGetDownloadUrl()
if l_0_9 ~= nil and string.find(l_0_9, "/$") ~= nil and not l_0_0(l_0_9, l_0_7) and l_0_0(l_0_9, l_0_8) and l_0_1(l_0_9, "/") == 3 and l_0_1(l_0_9, "%.") <= 2 then
  local l_0_10 = string.match(l_0_9, "://([a-z0-9]+)%.")
  if 9 <= #l_0_10 then
    local l_0_11 = string.match(l_0_9, "%.([a-z0-9]+)/")
    if 3 <= #l_0_11 then
      return mp.INFECTED
    end
  end
end
local l_0_12 = mp.GetMOTWHostUrl()
if l_0_12 ~= nil and string.find(l_0_12, "/$") ~= nil and not l_0_0(l_0_12, l_0_7) and l_0_0(l_0_12, l_0_8) and l_0_1(l_0_12, "/") == 3 and l_0_1(l_0_12, "%.") <= 2 then
  local l_0_13 = string.match(l_0_12, "://([a-z0-9]+)%.")
  if 9 <= #l_0_13 then
    local l_0_14 = string.match(l_0_12, "%.([a-z0-9]+)/")
    if 3 <= #l_0_14 then
      return mp.INFECTED
    end
  end
end
return mp.CLEAN
