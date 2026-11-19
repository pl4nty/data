-- Threat: !InfrastructureShared
-- Name: 107b3d72477c4
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter")
reportRelatedBmHits()
return mp.INFECTED
