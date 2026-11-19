-- Threat: !InfrastructureShared
-- Name: 7db3a77eadc5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1036.005", "DefenseEvasion_MasqueradeNameOrPath_Cron")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
