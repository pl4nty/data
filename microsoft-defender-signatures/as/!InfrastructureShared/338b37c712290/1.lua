-- Threat: !InfrastructureShared
-- Name: 338b37c712290
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1106", "Execution_NativeAPI_RansomCryptoAPI")
return mp.INFECTED
