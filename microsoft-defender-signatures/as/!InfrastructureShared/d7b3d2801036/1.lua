-- Threat: !InfrastructureShared
-- Name: d7b3d2801036
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "CommandandScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
