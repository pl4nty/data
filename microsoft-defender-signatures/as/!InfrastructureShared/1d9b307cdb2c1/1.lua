-- Threat: !InfrastructureShared
-- Name: 1d9b307cdb2c1
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1486", "Impact_Encryption")
reportRelatedBmHits()
addRelatedProcess()
return mp.INFECTED
