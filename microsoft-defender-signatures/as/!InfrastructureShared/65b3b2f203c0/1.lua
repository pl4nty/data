-- Threat: !InfrastructureShared
-- Name: 65b3b2f203c0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1572", "CommandAndControl_ProtocolTuneling")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
