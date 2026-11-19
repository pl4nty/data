-- Threat: !InfrastructureShared
-- Name: d6b3fc0eb2c6
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
