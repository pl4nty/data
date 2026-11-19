-- Threat: !InfrastructureShared
-- Name: dbb3b62d9209
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1003.008", "CredentialAccess_OSCredentialDumping_mt2023")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
