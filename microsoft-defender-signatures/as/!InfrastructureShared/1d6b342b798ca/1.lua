-- Threat: !InfrastructureShared
-- Name: 1d6b342b798ca
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1562.006", "DefenseEvasion_ImpairDefenses_IndicatorBlocking_TamperingAuditd")
return mp.INFECTED
