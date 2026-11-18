-- Threat: !InfrastructureShared
-- Name: 32b3a64070c3
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm.add_related_string("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
  l_0_0 = safeJsonDeserialize(l_0_0)
  if not l_0_0 then
    return mp.CLEAN
  end
  local l_0_1 = l_0_0.FilesToRemediate
  for l_0_2, l_0_3 in ipairs(l_0_1) do
    bm.add_related_file(l_0_3)
  end
end
return mp.INFECTED
