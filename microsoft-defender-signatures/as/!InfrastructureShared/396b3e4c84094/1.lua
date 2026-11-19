-- Threat: !InfrastructureShared
-- Name: 396b3e4c84094
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1647", "DefenseEvasion_DefaultsPlistFileModification")
mp.set_mpattribute("BM_PlistModUsingDefaults")
return mp.INFECTED
