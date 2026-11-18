-- Threat: !InfrastructureShared
-- Name: adb3be7e97c6
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TerminateParentProcessForLinux()
addRelatedProcess()
TrackPidAndTechniqueBM("BM", "T1003.005", "CredentialAccess")
addRelatedProcess()
return mp.INFECTED
