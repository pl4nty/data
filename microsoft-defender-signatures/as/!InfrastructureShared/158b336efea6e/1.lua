-- Decompiled using luadec 2.2 rev: 895d923 for Lua 5.1 from https://github.com/viruscamp/luadec
-- Command line: lua\!InfrastructureShared\158b336efea6e\1.luac 

-- params : ...
-- function num : 0
TrackPidAndTechniqueBM("BM", "T1053", "Persistence_ScheduledJob_Cron")
TrackPidAndTechniqueBM("BM", "T1543", "Persistence_CreateorModifySystemProcess")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED

