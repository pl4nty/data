-- Threat: !InfrastructureShared
-- Name: a6b3b475cecc
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1552.001", "CredentialAccess")
TrackPidAndTechniqueBM("BM", "T1074", "Collection_DataStaged")
addRelatedProcess()
return mp.INFECTED
