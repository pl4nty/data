-- Threat: !InfrastructureShared
-- Name: 5bb39b20684e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1048", "ExfiltrationOverAlternativeProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
