-- Threat: !InfrastructureShared
-- Name: 32b3dd6fc765
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "EMS", 5000, "Behavior:Win32/CobaltStrike.G!nri")
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
