-- Threat: !InfrastructureShared
-- Name: a5b33cee56b3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1059", "Execution_CommandAndScriptingInterpreter_Metasploit")
reportRelatedBmHits()
return mp.INFECTED
