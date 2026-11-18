-- Threat: !InfrastructureShared
-- Name: 6cb34f06bead
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[2].utf8p2)
  if not isnull(l_0_0) and not isnull(l_0_0.rename_ext) then
    bm.add_related_string("gen_ransom_ext_replaced", l_0_0.rename_ext, bm.RelatedStringBMReport)
    reportTimingData()
    return mp.INFECTED
  end
end
return mp.CLEAN
