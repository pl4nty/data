-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\45b3bf054419\1.luac 

-- params : ...
-- function num : 0
pcallEx("BlockC2Connection", BlockC2Connection, "cobaltstrike_j")
pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.J!sms")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
pcallEx("addChildrenAsThreat", addChildrenAsThreat)
reportPcallEx()
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  (bm.add_related_string)("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED

