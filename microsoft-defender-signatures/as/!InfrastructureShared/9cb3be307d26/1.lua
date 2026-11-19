-- Threat: !InfrastructureShared
-- Name: 9cb3be307d26
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1040", "Discovery_NetworkCapture_Sniffing_mt2023")
AddTechniqueGlobal("Discovery_NetworkCapture_Sniffing")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
