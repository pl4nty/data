-- Threat: !InfrastructureShared
-- Name: 2c6b36b286e29
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1562.006", "DefenseEvasion_ImpairDefenses_IndicatorBlocking_SecurityFrameworksTampering")
return mp.INFECTED
