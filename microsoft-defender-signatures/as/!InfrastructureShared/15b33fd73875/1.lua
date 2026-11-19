-- Threat: !InfrastructureShared
-- Name: 15b33fd73875
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1561.001", "Impact_DiskWipe")
addRelatedProcess()
reportRelatedBmHits()
RemediateProcessTreeForLinux()
return mp.INFECTED
