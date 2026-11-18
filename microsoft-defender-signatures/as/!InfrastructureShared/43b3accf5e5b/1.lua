-- Threat: !InfrastructureShared
-- Name: 43b3accf5e5b
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

add_parents()
TrackPidAndTechniqueBM("BM", "T1190", "nextjs_rsc_deser_rce", 28800)
return mp.INFECTED
