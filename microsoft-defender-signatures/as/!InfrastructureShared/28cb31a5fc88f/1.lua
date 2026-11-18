-- Threat: !InfrastructureShared
-- Name: 28cb31a5fc88f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1552", "CredentialAccess_UnsecuredCredentials")
return mp.INFECTED
