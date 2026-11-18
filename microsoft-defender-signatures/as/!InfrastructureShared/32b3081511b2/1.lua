-- Threat: !InfrastructureShared
-- Name: 32b3081511b2
-- Type: 21
-- Includes: LuaFuncHelper

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  bm.add_related_string("Evidence", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if l_0_0 and l_0_0.Dll_Path then
    bm.add_related_file(l_0_0.Dll_Path)
  end
end
return mp.INFECTED
