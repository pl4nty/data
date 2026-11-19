-- Threat: !InfrastructureShared
-- Name: 49b33709966d
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1562.001", "DefenseEvasion_nmi_watchdog")
addRelatedProcess()
reportRelatedBmHits()
RemediateProcessTreeForLinux()
return mp.INFECTED
