-- Threat: !InfrastructureShared
-- Name: b1b3a952628d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0 = 100000000
local l_0_1 = bm.GetSignatureMatchDuration()
if l_0_0 < l_0_1 then
  return mp.CLEAN
end
local l_0_2
if this_sigattrlog[1].matched and this_sigattrlog[1].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[1].utf8p2)
elseif this_sigattrlog[2].matched and this_sigattrlog[2].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[2].utf8p2)
elseif this_sigattrlog[3].matched and this_sigattrlog[3].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[3].utf8p2)
elseif this_sigattrlog[4].matched and this_sigattrlog[4].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[4].utf8p2)
elseif this_sigattrlog[5].matched and this_sigattrlog[5].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[5].utf8p2)
elseif this_sigattrlog[6].matched and this_sigattrlog[6].wp2 ~= nil then
  l_0_2 = string.lower(this_sigattrlog[6].utf8p2)
end
if l_0_2 then
  if this_sigattrlog[2].matched and string.find(l_0_2, "copy-as-is", 1, true) and string.find(l_0_2, "/usr/share/rear", 1, true) then
    return mp.CLEAN
  end
  if 2000 <= #l_0_2 then
    TrackPidAndTechniqueBM("BM", "T1560", "Collection_ArchiveData")
    bm.add_related_string("archive_cmd", l_0_2, bm.RelatedStringBMReport)
    reportRelatedBmHits()
    return mp.INFECTED
  end
end
return mp.CLEAN
