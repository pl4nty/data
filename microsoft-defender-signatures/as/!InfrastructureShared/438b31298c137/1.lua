-- Threat: !InfrastructureShared
-- Name: 438b31298c137
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1552", "CredentialAccess_UnsecuredCredentials")
return mp.INFECTED
