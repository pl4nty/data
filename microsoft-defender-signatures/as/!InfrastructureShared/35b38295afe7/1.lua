-- Threat: !InfrastructureShared
-- Name: 35b38295afe7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1574", "DefenseEvasion_HijackExecutionFlow_LDPRELOAD_WWD")
reportRelatedBmHits()
return mp.INFECTED
