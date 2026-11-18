-- Threat: !InfrastructureShared
-- Name: 99b380d249c3
-- Type: 21
-- Includes: BMLuaLib, TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1040", "Network_Sniffing")
reportRelatedBmHits()
return mp.INFECTED
