-- Threat: !InfrastructureShared
-- Name: 2f3b32505fd36
-- Type: 21
-- Includes: TechniqueTracker

mp.set_mpattribute("BM_ClearSysLog")
TrackPidAndTechniqueBM("BM", "T1070.002", "DefenseEvasion_IndicatorRemoval_LogErase")
return mp.INFECTED
