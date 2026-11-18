-- Threat: !InfrastructureShared
-- Name: 35b39bb49487
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

local l_0_0 = GetRollingQueue("mace_atosev")
if l_0_0 == nil then
  return mp.CLEAN
end
pcallEx("BlockC2Connection", BlockC2Connection, "cobaltstrike_h")
pcallEx("maceSendConfig", maceSendConfig, "mace_atosev")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
pcallEx("triggerMemoryScanOnProcessTree", triggerMemoryScanOnProcessTree, false, true, "SMS_H", 5000, "Behavior:Win32/CobaltStrike.H!sms")
reportPcallEx()
local l_0_1, l_0_2 = pcall(reportBmInfo)
if not l_0_1 and l_0_2 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_2), bm.RelatedStringBMReport)
end
return mp.INFECTED
