-- Threat: !InfrastructureShared
-- Name: ffb34861a042
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol_SensitiveDataExfil")
return mp.INFECTED
