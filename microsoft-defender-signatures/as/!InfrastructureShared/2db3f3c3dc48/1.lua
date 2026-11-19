-- Threat: !InfrastructureShared
-- Name: 2db3f3c3dc48
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[1].matched then
  l_0_0 = string.lower(this_sigattrlog[1].utf8p1)
elseif this_sigattrlog[2].matched then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 and string.match(l_0_0, "/%.[^/]+$") then
  TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts_mt2023")
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
