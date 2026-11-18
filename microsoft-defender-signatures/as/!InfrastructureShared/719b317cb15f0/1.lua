-- Threat: !InfrastructureShared
-- Name: 719b317cb15f0
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "CommandandScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
