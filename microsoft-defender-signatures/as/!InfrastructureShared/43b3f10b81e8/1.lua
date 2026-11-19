-- Threat: !InfrastructureShared
-- Name: 43b3f10b81e8
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("maceSendConfig", maceSendConfig, "mace_systembc")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
reportRelevantUntrustedEntities(1)
reportTimingData()
local l_0_0, l_0_1 = pcall(reportBmInfo)
if not l_0_0 and l_0_1 then
  bm.add_related_string("bmInfoFailReason", tostring(l_0_1), bm.RelatedStringBMReport)
end
return mp.INFECTED
