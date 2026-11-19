-- Threat: !InfrastructureShared
-- Name: 1c4b36b70422e
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

AddResearchData("BM", true)
addRelatedProcess()
reportRelatedBmHits()
TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_MountedWWDBehavior")
return mp.INFECTED
