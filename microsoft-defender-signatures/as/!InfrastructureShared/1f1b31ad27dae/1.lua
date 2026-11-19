-- Threat: !InfrastructureShared
-- Name: 1f1b31ad27dae
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1102", "CommandAndControl_WebService")
TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
