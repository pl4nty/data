-- Threat: !InfrastructureShared
-- Name: adb37abeb54f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1040", "CredentialAccess_NetworkSniffing_MemoryExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
