-- Threat: !InfrastructureShared
-- Name: 62b3d15761bd
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TerminateParentProcessForLinux()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
addRelatedProcess()
return mp.INFECTED
