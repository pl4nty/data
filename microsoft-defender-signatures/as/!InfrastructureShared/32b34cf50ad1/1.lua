-- Threat: !InfrastructureShared
-- Name: 32b34cf50ad1
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 then
  local l_0_0 = this_sigattrlog[1].utf8p2
  bm.add_related_string("AdditionalInfo", l_0_0, bm.RelatedStringBMReport)
end
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
