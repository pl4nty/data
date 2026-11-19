-- Threat: !InfrastructureShared
-- Name: 15b344c47506
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1562.001", "DefenseEvasion_nmi_watchdog")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
