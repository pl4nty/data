-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\43b3f10b81e8\1_luac 

-- params : ...
-- function num : 0
pcallEx("maceSendConfig", maceSendConfig, "mace_systembc")
pcallEx("reportRelatedBmHits", reportRelatedBmHits)
reportRelevantUntrustedEntities(1)
reportTimingData()
return mp.INFECTED

