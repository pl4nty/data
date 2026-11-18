-- Threat: !InfrastructureShared
-- Name: adb3b261f7a3
-- Type: 21
-- Includes: BMLuaLib

local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
