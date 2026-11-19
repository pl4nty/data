-- Threat: !InfrastructureShared
-- Name: 109b308197973
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, BasScenarioSpecificInfra

if not this_sigattrlog[5].matched or this_sigattrlog[5].utf8p1 == nil then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
local l_0_0 = this_sigattrlog[5].utf8p1
bm.add_threat_file(l_0_0)
bm.add_related_string("picus_temp_dll", string.lower(l_0_0), bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1574.001", "picus_signed_binary_temp_dll")
return mp.INFECTED
