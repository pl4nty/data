-- Threat: !InfrastructureShared
-- Name: 39b31a94bc77
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1027.002", "DefenseEvasion_Packing")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
