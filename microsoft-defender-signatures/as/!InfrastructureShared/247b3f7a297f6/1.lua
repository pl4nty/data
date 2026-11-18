-- Threat: !InfrastructureShared
-- Name: 247b3f7a297f6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1219", "CommandAndControl_RemoteAccessSoftware_PossibleLinuxRAT")
return mp.INFECTED
