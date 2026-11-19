-- Threat: !InfrastructureShared
-- Name: 32b35baa95b7
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1095", "CommandandControl_NonApplicationLayerProtocol_mt2023")
TrackPidAndTechniqueBM("BM", "T1071", "CommandandControl_ApplicationLayerProtocol_mt2023")
reportRelatedBmHits()
return mp.INFECTED
