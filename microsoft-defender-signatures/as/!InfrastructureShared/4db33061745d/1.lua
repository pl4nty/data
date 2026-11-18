-- Threat: !InfrastructureShared
-- Name: 4db33061745d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1485", "Impact_DataDestructionIntent")
addRelatedProcess()
reportRelatedBmHits()
RemediateProcessTreeForLinux()
return mp.INFECTED
