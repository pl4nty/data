-- Threat: !InfrastructureShared
-- Name: 2db3097773b7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p1 ~= nil then
  l_0_0 = string.lower(this_sigattrlog[2].utf8p1)
end
if l_0_0 and string.match(l_0_0, "/%.[^/]+$") then
  TrackPidAndTechniqueBM("BM", "T1070.001", "DefenseEvasion_IndicatorRemoval_FileDeletion_mt2023")
  reportRelatedBmHits()
  return mp.INFECTED
end
return mp.CLEAN
