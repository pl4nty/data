-- Threat: !InfrastructureShared
-- Name: 11ab3fced6587
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
