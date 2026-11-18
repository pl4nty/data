-- Threat: !InfrastructureShared
-- Name: 3e1b3348134d5
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
