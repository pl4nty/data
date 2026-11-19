-- Threat: !InfrastructureShared
-- Name: 21bb3bc45bbe7
-- Type: 21
-- Includes: BMLuaLib

addRelatedProcess()
reportRelatedBmHits()
local l_0_0
if this_sigattrlog[4].matched and this_sigattrlog[4].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[4].utf8p1)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[5].utf8p1)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[6].utf8p1)
elseif this_sigattrlog[7].matched and this_sigattrlog[7].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[7].utf8p1)
elseif this_sigattrlog[8].matched and this_sigattrlog[8].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[8].utf8p1)
elseif this_sigattrlog[9].matched and this_sigattrlog[9].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[9].utf8p1)
elseif this_sigattrlog[10].matched and this_sigattrlog[10].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[10].utf8p1)
elseif this_sigattrlog[11].matched and this_sigattrlog[11].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[11].utf8p1)
end
if l_0_0 == nil or #l_0_0 < 2 then
  return mp.CLEAN
end
bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
return mp.INFECTED
