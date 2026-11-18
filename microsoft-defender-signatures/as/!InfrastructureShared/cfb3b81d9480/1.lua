-- Threat: !InfrastructureShared
-- Name: cfb3b81d9480
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged_StagedSensitiveFile")
return mp.INFECTED
