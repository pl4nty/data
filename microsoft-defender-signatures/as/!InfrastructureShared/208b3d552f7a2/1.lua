-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\208b3d552f7a2\1.luac 

-- params : ...
-- function num : 0
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1562.006", "DefenseEvasion_ImpairDefenses_IndicatorBlocking_TamperingSyslog")
return mp.INFECTED

