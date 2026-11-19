-- Threat: !InfrastructureShared
-- Name: 71b33ebc9d69
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker, BasScenarioSpecificInfra

if not this_sigattrlog[1].matched or this_sigattrlog[1].utf8p2 == nil then
  return mp.CLEAN
end
if not this_sigattrlog[2].matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "Picus") and not IsBasToolProcessFoundInParents("BM", "Picus", 4) then
  return mp.CLEAN
end
local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
if string.find(l_0_0, "\\appdata\\local\\temp\\", 1, true) == nil then
  return mp.CLEAN
end
bm.add_related_string("picus_jscript_rpc", l_0_0, bm.RelatedStringBMReport)
add_parents()
TrackPidAndTechniqueBM("BM", "T1021.003", "picus_temp_jscript_rpc")
return mp.INFECTED
