-- Threat: !InfrastructureShared
-- Name: 188b357da349a
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p2)
end
if l_0_0 == nil or #l_0_0 < 4 or 20000 < #l_0_0 then
  return mp.CLEAN
end
if string.find(l_0_0, "/cp /proc/", 1, true) or string.find(l_0_0, " cp /proc/", 1, true) or string.find(l_0_0, "cp /proc/", 1, true) == 1 then
  bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
