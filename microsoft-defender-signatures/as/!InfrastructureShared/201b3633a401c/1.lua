-- Threat: !InfrastructureShared
-- Name: 201b3633a401c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1486", "Impact_GpgEncryption")
return mp.INFECTED
