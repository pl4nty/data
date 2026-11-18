-- Threat: !InfrastructureShared
-- Name: 17ab33f04d441
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

reportRelatedBmHits()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1053.003", "Persistence_SuspiciousCronActivity")
return mp.INFECTED
