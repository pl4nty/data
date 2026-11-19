-- Threat: !InfrastructureShared
-- Name: 2cb31567c800
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_BruteForce")
reportRelatedBmHits()
return mp.INFECTED
