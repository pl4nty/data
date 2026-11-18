-- Threat: !InfrastructureShared
-- Name: 32b313ca3433
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm.add_related_string("MassRecon_H_Machine_Event", l_0_0, bm.RelatedStringBMReport)
  local l_0_1 = GetRollingQueue("ReconTracking")
  bm.add_related_string("MassRecon_H_Machine", safeJsonSerialize(l_0_1), bm.RelatedStringBMReport)
end
reportSessionInformationInclusive()
reportTimingData()
return mp.INFECTED
