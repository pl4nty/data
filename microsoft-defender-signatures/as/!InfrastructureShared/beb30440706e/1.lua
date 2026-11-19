-- Threat: !InfrastructureShared
-- Name: beb30440706e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1222", "DefenseEvasion_PermissionModification_ChmodToExec")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
