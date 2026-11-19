-- Threat: !InfrastructureShared
-- Name: 42b3451ef734
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
end
if l_0_0 == nil then
  return mp.CLEAN
end
if string.find(l_0_0, "/cp /proc/", 1, true) or string.find(l_0_0, " cp /proc/", 1, true) or string.find(l_0_0, "cp /proc/", 1, true) == 1 then
  bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
  addRelatedProcess()
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
