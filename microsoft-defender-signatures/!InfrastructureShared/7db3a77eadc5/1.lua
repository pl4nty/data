-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\7db3a77eadc5\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_MasqueradeNameOrPath_Cron")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

