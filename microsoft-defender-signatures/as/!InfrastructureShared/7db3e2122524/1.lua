-- Threat: !InfrastructureShared
-- Name: 7db3e2122524
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, BasScenarioSpecificInfra

if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[2].utf8p2
if l_0_0 ~= nil then
  bm.add_related_string("picus_firewall_disable", string.lower(l_0_0), bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1562.004", "picus_firewall_disable")
return mp.INFECTED
