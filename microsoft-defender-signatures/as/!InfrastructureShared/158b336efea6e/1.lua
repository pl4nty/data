-- Threat: !InfrastructureShared
-- Name: 158b336efea6e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1053", "Persistence_ScheduledJob_Cron")
TrackPidAndTechniqueBM("BM", "T1543", "Persistence_CreateorModifySystemProcess")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
