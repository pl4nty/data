-- Threat: !InfrastructureShared
-- Name: 6cb3b5bf4877
-- Type: 21
-- Includes: BMLuaLib, LuaFuncHelper

pcallEx("maceSendConfig", maceSendConfig, "mace_systembc")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
reportRelevantUntrustedEntities(1)
reportTimingData()
return mp.INFECTED
