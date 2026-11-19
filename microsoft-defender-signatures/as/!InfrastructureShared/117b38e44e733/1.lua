-- Threat: !InfrastructureShared
-- Name: 117b38e44e733
-- Type: 21
-- Includes: BMLuaLib, BasScenarioSpecificInfra

if not this_sigattrlog[3].matched then
  return mp.CLEAN
end
if not this_sigattrlog[7].matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "AttackIQ") and not IsBasToolProcessFoundInParents("BM", "AttackIQ", 4) then
  return mp.CLEAN
end
local l_0_0 = bm.get_imagepath()
if isnull(l_0_0) then
  return mp.CLEAN
end
bm.add_related_string("aiq_cpe_proc", string.lower(l_0_0), bm.RelatedStringBMReport)
add_parents()
return mp.INFECTED
