-- Threat: !InfrastructureShared
-- Name: 2db37364b75b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_BruteForce")
reportRelatedBmHits()
return mp.INFECTED
