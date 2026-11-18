-- Threat: !InfrastructureShared
-- Name: 55b3aa6463f6
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1485", "Impact_DataDestructionIntent")
addRelatedProcess()
reportRelatedBmHits()
RemediateProcessTreeForLinux()
return mp.INFECTED
