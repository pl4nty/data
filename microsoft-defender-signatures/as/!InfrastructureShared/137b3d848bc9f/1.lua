-- Threat: !InfrastructureShared
-- Name: 137b3d848bc9f
-- Type: 21
-- Includes: BMLuaLib

local l_0_0
if this_sigattrlog[1].matched and this_sigattrlog[1].utf8p2 ~= nil then
  l_0_0 = this_sigattrlog[1].utf8p2
end
if l_0_0 then
  l_0_0 = l_0_0:lower()
  local l_0_1 = l_0_0:match("node%.exe\"?%s+\"?([^\"]+%.js)\"?")
  bm.add_threat_file(l_0_1)
end
local l_0_2, l_0_3 = pcall(reportBmInfo)
if not l_0_2 and l_0_3 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_3), bm.RelatedStringBMReport)
end
return mp.INFECTED
