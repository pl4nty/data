-- Threat: !InfrastructureShared
-- Name: 96b33842cabc
-- Type: 21
-- Includes: TechniqueTracker, BMLuaLib

TrackPidAndTechniqueBM("BM", "T1080", "LateralMovement_TaintSharedContent_MountOverSSH")
addRelatedProcess()
reportRelatedBmHits()
return mp.INFECTED
