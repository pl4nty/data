-- Threat: !InfrastructureShared
-- Name: 32b33432fc95
-- Type: 21
-- Includes: LuaFuncHelper, BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  bm.add_related_string("Evidence", this_sigattrlog[1].utf8p2, bm.RelatedStringBMReport)
  local l_0_0 = safeJsonDeserialize(this_sigattrlog[1].utf8p2)
  if l_0_0 and l_0_0.FilePath then
    bm.add_related_file(l_0_0.FilePath)
  end
end
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
