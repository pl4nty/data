-- Threat: !InfrastructureShared
-- Name: f1b30658a29f
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1098", "Persistence_AccountManipulation")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
