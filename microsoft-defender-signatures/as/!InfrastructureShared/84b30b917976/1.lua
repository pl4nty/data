-- Threat: !InfrastructureShared
-- Name: 84b30b917976
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1059.004", "Execution")
TrackPidAndTechniqueBM("BM", "T1071.001", "CommandAndControl")
addChildrenAsThreat()
return mp.INFECTED
