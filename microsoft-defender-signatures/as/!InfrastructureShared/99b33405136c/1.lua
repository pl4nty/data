-- Threat: !InfrastructureShared
-- Name: 99b33405136c
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
