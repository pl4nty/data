-- Threat: !InfrastructureShared
-- Name: 16ab32c8884e8
-- Type: 21
-- Includes: PeParser, LuaFuncHelper

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
elseif this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
elseif this_sigattrlog[4].matched then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
end
local l_0_1 = l_0_0:match("([^\\]+)$")
if not l_0_1 then
  return mp.CLEAN
end
local l_0_2 = GetRollingQueueKeyValue("app_version_" .. l_0_1, l_0_0)
if l_0_2 == nil then
  local l_0_3 = sysio.GetPEFixedVersionInfo(l_0_0)
  if not l_0_3 then
    return mp.CLEAN
  end
  local l_0_4 = l_0_3.FileVersion
  local l_0_5 = "app_version_" .. l_0_1
  local l_0_6 = 31536000
  local l_0_7 = 50
  if l_0_4 ~= nil then
    local l_0_8 = Version_to_str(l_0_4)
    AppendToRollingQueue(l_0_5, l_0_0, l_0_8, l_0_6, l_0_7)
    bm.add_related_string("AppVersion", l_0_8, bm.RelatedStringBMReport)
    if l_0_3.OriginalFilename then
      bm.add_related_string("OFN", l_0_3.OriginalFilename, bm.RelatedStringBMReport)
    end
  end
else
  bm.add_related_string("AppVersion", l_0_2, bm.RelatedStringBMReport)
end
local l_0_9 = GetRollingQueueKeyValue("app_version_timer" .. l_0_1, l_0_0)
if l_0_9 == nil then
  l_0_9 = MpCommon.GetCurrentTimeT()
  local l_0_10 = "app_version_timer" .. l_0_1
  local l_0_11 = 31536000
  local l_0_12 = 50
  AppendToRollingQueue(l_0_10, l_0_0, l_0_9, l_0_11, l_0_12)
  bm.add_related_string("VerLastSent", l_0_9, bm.RelatedStringBMReport)
  return mp.INFECTED
end
local l_0_13 = MpCommon.GetCurrentTimeT()
local l_0_14 = (l_0_13 - l_0_9) / 60
local l_0_16 = l_0_14 <= 21600
if l_0_16 then
  return mp.CLEAN
end
local l_0_17 = 31536000
local l_0_18 = 50
AppendToRollingQueue("app_version_timer" .. l_0_1, l_0_0, l_0_13, l_0_17, l_0_18)
return mp.INFECTED
