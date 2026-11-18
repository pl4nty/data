-- Threat: !InfrastructureShared
-- Name: 2bb3536bcf89
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_BruteForce")
reportRelatedBmHits()
return mp.INFECTED
