-- Threat: !InfrastructureShared
-- Name: 12bb33e440514
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "CommandandScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
