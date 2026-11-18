-- Threat: !InfrastructureShared
-- Name: 9ab313b459a4
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[2].matched and this_sigattrlog[2].utf8p2 then
  l_0_0 = this_sigattrlog[2].utf8p2
end
if this_sigattrlog[3].matched and this_sigattrlog[3].utf8p2 then
  l_0_0 = this_sigattrlog[3].utf8p2
end
if not l_0_0 or not contains(l_0_0, {
  " install",
  " ci",
  " update",
  " rebuild"
}) then
  return mp.CLEAN
end
add_parents()
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
