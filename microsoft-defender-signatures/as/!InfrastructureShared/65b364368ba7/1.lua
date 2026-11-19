-- Threat: !InfrastructureShared
-- Name: 65b364368ba7
-- Type: 21
-- Includes: BMLuaLib

if this_sigattrlog[1].matched then
  local l_0_0 = string.lower(this_sigattrlog[1].utf8p2)
  bm_AddRelatedFileFromCommandLine(l_0_0, nil, nil, 1)
end
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
add_parents()
return mp.INFECTED
