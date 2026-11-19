-- Threat: !InfrastructureShared
-- Name: beb365f2165e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1552.001", "CredentialAccess")
TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged")
addRelatedProcess()
return mp.INFECTED
