-- Threat: !InfrastructureShared
-- Name: 88b3d67db104
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
return mp.INFECTED
