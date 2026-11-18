-- Threat: !InfrastructureShared
-- Name: 208b3d552f7a2
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1562.006", "DefenseEvasion_ImpairDefenses_IndicatorBlocking_TamperingSyslog")
return mp.INFECTED
