-- Threat: !InfrastructureShared
-- Name: 5bb3e0726380
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
