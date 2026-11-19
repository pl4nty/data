-- Threat: !InfrastructureShared
-- Name: 32b3d4e141d9
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  local l_0_1, l_0_2 = l_0_0:match("(%d+);(%w+)")
  bm.add_related_string("detection_weight", l_0_1, bm.RelatedStringBMReport)
  local l_0_3 = GetRollingQueue(l_0_2)
  bm.add_related_string(this_sigattrlog[1].utf8p1, safeJsonSerialize(l_0_3), bm.RelatedStringBMReport)
end
reportSessionInformationInclusive()
reportRelevantUntrustedEntities(0)
reportTimingData()
return mp.INFECTED
