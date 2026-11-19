-- Threat: !InfrastructureShared
-- Name: 84b304374583
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1564.001", "DefenseEvasion_HiddenArtifacts")
TrackPidAndTechniqueBM("BM", "T1059.004", "Execution_UnixShell")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
