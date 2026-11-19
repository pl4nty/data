-- Threat: !InfrastructureShared
-- Name: 21b34b00008f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].np2 then
  l_0_0 = this_sigattrlog[1].np2
end
if not l_0_0 then
  return mp.CLEAN
end
if not (69000 <= l_0_0) or not (l_0_0 <= 79000) then
  return mp.CLEAN
end
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
