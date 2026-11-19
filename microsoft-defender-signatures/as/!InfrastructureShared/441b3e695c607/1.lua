-- Threat: !InfrastructureShared
-- Name: 441b3e695c607
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
