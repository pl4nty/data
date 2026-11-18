-- Threat: !InfrastructureShared
-- Name: 32b344a72c81
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1048", "ExfiltrationOverAlternativeProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
