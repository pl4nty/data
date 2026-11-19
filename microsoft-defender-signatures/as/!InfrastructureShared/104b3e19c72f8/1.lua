-- Threat: !InfrastructureShared
-- Name: 104b3e19c72f8
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1567", "ExfilOverWeb")
reportRelatedBmHits()
add_parents()
addOverallNetworkVolume()
return mp.INFECTED
