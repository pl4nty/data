-- Threat: !InfrastructureShared
-- Name: 84b37a04592e
-- Type: 21
-- Includes: PeParser, LuaFuncHelper

local l_0_0, l_0_1
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
end
if this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if this_sigattrlog[3].matched then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p1)
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_1 = l_0_0:match("(%w+%.exe)$")
local l_0_2 = GetRollingQueueKeyValue("app_version_" .. l_0_1, l_0_0)
if l_0_2 ~= nil then
  return mp.CLEAN
end
local l_0_3 = sysio.GetPEFixedVersionInfo(l_0_0)
if not l_0_3 then
  return mp.CLEAN
end
local l_0_4 = l_0_3.FileVersion
local l_0_5 = sysio.GetPEVersionInfo(l_0_0)
if not l_0_5 then
  return mp.CLEAN
end
local l_0_6 = l_0_5.OriginalFilename
if l_0_4 == 0 or not l_0_6 then
  return mp.CLEAN
end
local l_0_7 = "app_version_" .. l_0_6
local l_0_8 = 31536000
local l_0_9 = 50
local l_0_10 = Version_to_str(l_0_4)
AppendToRollingQueue(l_0_7, l_0_0, l_0_10, l_0_8, l_0_9)
bm.add_related_string("AppVersionFixed", l_0_10, bm.RelatedStringBMReport)
return mp.INFECTED
