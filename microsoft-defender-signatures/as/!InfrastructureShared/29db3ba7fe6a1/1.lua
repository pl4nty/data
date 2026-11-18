-- Threat: !InfrastructureShared
-- Name: 29db3ba7fe6a1
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1039", "Collection_DatafromNetworkSharedDrive_FileDiscoveryfromSharedDrive")
return mp.INFECTED
