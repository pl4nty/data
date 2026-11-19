-- Threat: !InfrastructureShared
-- Name: 77b3d7c3a32c
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
return mp.INFECTED
