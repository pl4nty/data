-- Threat: !InfrastructureShared
-- Name: ffb3f322ff95
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0
if this_sigattrlog[6].matched and this_sigattrlog[6].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[6].utf8p2
end
if l_0_0 == nil then
  return mp.CLEAN
end
TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess")
bm.add_related_string("file_metadata", l_0_0, bm.RelatedStringBMReport)
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
