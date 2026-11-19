-- Threat: !InfrastructureShared
-- Name: 62d79af4aa26
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
TrackPidAndTechnique(l_0_0, "sim_tool", "monkey")
return mp.CLEAN
