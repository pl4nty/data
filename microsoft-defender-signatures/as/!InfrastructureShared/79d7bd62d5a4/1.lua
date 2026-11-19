-- Threat: !InfrastructureShared
-- Name: 79d7bd62d5a4
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
TrackPidAndTechnique(l_0_0, "sim_tool", "attackiq")
return mp.CLEAN
