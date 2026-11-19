-- Threat: !InfrastructureShared
-- Name: 2db3e06ab97e
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1110", "CredentialAccess_BruteForce")
reportRelatedBmHits()
return mp.INFECTED
