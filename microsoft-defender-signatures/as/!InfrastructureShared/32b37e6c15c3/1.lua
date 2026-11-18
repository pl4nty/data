-- Threat: !InfrastructureShared
-- Name: 32b37e6c15c3
-- Type: 21
-- Includes: BMLuaLib

triggerMemoryScanOnProcessTree(true, true, "SMS_H", 5000, "Behavior:Win32/ICEBreak.SA")
add_parents()
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
