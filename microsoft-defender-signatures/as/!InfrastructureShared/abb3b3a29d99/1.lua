-- Threat: !InfrastructureShared
-- Name: abb3b3a29d99
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1562.006", "DefenseEvasion_ImpairDefenses_IndicatorBlocking_NmiWatchdog")
return mp.INFECTED
