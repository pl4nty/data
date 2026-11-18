-- Threat: !InfrastructureShared
-- Name: ffb3cccd8635
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1005", "CredentialAccess_SensitiveFileExfill")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
