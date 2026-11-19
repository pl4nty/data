-- Threat: !InfrastructureShared
-- Name: 69b3036245af
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Discovery_FileAndDirectoryDiscovery")
reportRelatedBmHits()
return mp.INFECTED
