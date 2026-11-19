-- Threat: !InfrastructureShared
-- Name: 14ab32fedc4cf
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1133", "InitialAccess_ExternalRemoteServices_SSHSuspiciousCommandExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
