-- Threat: !InfrastructureShared
-- Name: 1b6b33b762139
-- Type: 21
-- Includes: BMLuaLib, BasScenarioSpecificInfra

if not this_sigattrlog[3].matched or not this_sigattrlog[4].matched then
  return mp.CLEAN
end
if not IsBasToolProcessForPpid("BM", "AttackIQ") and not IsBasToolProcessFoundInParents("BM", "AttackIQ", 4) then
  return mp.CLEAN
end
if this_sigattrlog[3].utf8p2 ~= nil then
  local l_0_0 = string.lower(this_sigattrlog[3].utf8p2)
  if not string.find(l_0_0, "/format:", 1, true) then
    return mp.CLEAN
  end
  bm.add_related_string("aiq_xsl_wmic", l_0_0, bm.RelatedStringBMReport)
end
add_parents()
return mp.INFECTED
