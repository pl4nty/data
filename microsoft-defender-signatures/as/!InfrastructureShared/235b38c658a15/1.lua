-- Threat: !InfrastructureShared
-- Name: 235b38c658a15
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1106", "Execution_NativeAPI_RansomCryptoAPI")
return mp.INFECTED
