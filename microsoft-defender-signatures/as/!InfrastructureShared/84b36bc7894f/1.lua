-- Threat: !InfrastructureShared
-- Name: 84b36bc7894f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1574", "DefenseEvasion_HijackExecutionFlow_LDPRELOAD_Hidden")
reportRelatedBmHits()
return mp.INFECTED
