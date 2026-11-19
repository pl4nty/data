-- Threat: !InfrastructureShared
-- Name: 187b315157bb1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

reportRelatedBmHits()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1070.002", "DefenseEvasion_IndicatorRemovalOnHost_ClearSystemLogs")
return mp.INFECTED
