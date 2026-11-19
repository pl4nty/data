-- Threat: !InfrastructureShared
-- Name: 17eb3badd82e8
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p2
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[4].utf8p2
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[5].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
l_0_0 = string.lower(l_0_0)
local l_0_1 = {
  "RemoteRunner.hta"
}
if contains(l_0_0, l_0_1) then
  return mp.CLEAN
end
if contains(l_0_0, {
  " -s ",
  " -q ",
  "start-process",
  "urlcache",
  "transfer",
  "http"
}) then
  bm.add_related_string("Capfetox_cmdline_H", l_0_0, bm.RelatedStringBMReport)
  return mp.INFECTED
end
return mp.CLEAN
