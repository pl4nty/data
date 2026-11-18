-- Threat: !InfrastructureShared
-- Name: 81b3493fba36
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("BlockC2Connection", BlockC2Connection, "cobaltstrike_j")
pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.J!sms")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
pcallEx("addChildrenAsThreat", addChildrenAsThreat)
reportPcallEx()
return mp.INFECTED
