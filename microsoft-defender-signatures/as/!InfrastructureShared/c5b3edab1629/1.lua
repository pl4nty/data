-- Threat: !InfrastructureShared
-- Name: c5b3edab1629
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, BasScenarioSpecificInfra

local l_0_0
if this_sigattrlog[2].matched then
  l_0_0 = this_sigattrlog[2]
elseif this_sigattrlog[3].matched then
  l_0_0 = this_sigattrlog[3]
else
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
local l_0_1 = l_0_0.utf8p2
if l_0_1 ~= nil then
  bm.add_related_string("picus_psexec", string.lower(l_0_1), bm.RelatedStringBMReport)
end
add_parents()
TrackPidAndTechniqueBM("BM", "T1569.002", "picus_psexec_simulation")
return mp.INFECTED
