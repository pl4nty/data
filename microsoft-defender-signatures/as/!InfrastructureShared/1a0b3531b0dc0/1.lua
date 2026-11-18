-- Threat: !InfrastructureShared
-- Name: 1a0b3531b0dc0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1486", "Impact_FileEncryption")
return mp.INFECTED
