-- Threat: !InfrastructureShared
-- Name: 91b383b5d381
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1059.006", "Execution")
TrackPidAndTechniqueBM("BM", "T1071.001", "CommandAndControl")
addRelatedProcess()
return mp.INFECTED
