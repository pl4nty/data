-- Threat: !InfrastructureShared
-- Name: 4b5b3d76701be
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1552", "CredentialAccess_UnsecuredCredentials")
return mp.INFECTED
