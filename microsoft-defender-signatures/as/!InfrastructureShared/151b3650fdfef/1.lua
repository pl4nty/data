-- Threat: !InfrastructureShared
-- Name: 151b3650fdfef
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

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
end
if l_0_0 == nil or l_0_0 == "" then
  return mp.CLEAN
end
bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
TrackPidAndTechniqueBM("BM", "T1204.002", "Execution_MaliciousFile")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
