-- Threat: !InfrastructureShared
-- Name: 8fb3a9a6e87d
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

local l_0_0, l_0_1
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 ~= nil then
  l_0_1 = this_sigattrlog[3].utf8p2
end
if l_0_1 and l_0_0 and string.match(l_0_1, "/%.[^/]+$") and string.find(l_0_0, l_0_1, 1, true) then
  TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts_mt2023")
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
