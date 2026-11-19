-- Threat: !InfrastructureShared
-- Name: c1b340918b2b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
