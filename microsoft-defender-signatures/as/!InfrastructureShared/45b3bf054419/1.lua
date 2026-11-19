-- Threat: !InfrastructureShared
-- Name: 45b3bf054419
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("BlockC2Connection", BlockC2Connection, "cobaltstrike_j")
pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.J!sms")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
pcallEx("addChildrenAsThreat", addChildrenAsThreat)
reportPcallEx()
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
