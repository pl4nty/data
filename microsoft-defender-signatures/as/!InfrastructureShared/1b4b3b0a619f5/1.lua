-- Threat: !InfrastructureShared
-- Name: 1b4b3b0a619f5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1140", "DefenseEvasion_DeobfuscateDecodeFilesorInformation_Suspiciousbase64")
return mp.INFECTED
