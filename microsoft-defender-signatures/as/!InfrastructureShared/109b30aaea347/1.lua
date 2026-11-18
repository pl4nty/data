-- Threat: !InfrastructureShared
-- Name: 109b30aaea347
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1133", "InitialAccess_ExternalRemoteServices_SSHSuspiciousCommandExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
