-- Threat: !InfrastructureShared
-- Name: 15fd73b53bc29
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
TrackPidAndTechnique(l_0_0, "sim_tool", "cymulate")
return mp.CLEAN
