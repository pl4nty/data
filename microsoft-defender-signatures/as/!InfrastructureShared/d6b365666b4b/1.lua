-- Threat: !InfrastructureShared
-- Name: d6b365666b4b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1105", "CommandAndControl_IngressToolTransfer_SuspiciousRemoteFileExecution")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
