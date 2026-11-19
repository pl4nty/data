-- Threat: !InfrastructureShared
-- Name: 67b3c7db3479
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1562.001", "DefenseEvasion")
addRelatedProcess()
reportRelatedBmHits()
RemediateProcessTreeForLinux()
return mp.INFECTED
