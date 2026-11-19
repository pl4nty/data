-- Threat: !InfrastructureShared
-- Name: 1a2b3c7326c6f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
return mp.INFECTED
