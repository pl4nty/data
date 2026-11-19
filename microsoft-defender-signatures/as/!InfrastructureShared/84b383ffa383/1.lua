-- Threat: !InfrastructureShared
-- Name: 84b383ffa383
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[2].utf8p1
elseif this_sigattrlog[3].matched and this_sigattrlog[3].utf8p1 ~= nil then
  l_0_0 = this_sigattrlog[3].utf8p1
end
if l_0_0 and string.match(l_0_0, "/%.[^/]+$") then
  TrackPidAndTechniqueBM("BM", "T1003.008", "OSCredentialDumping_mt2023")
  TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts_mt2023")
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
