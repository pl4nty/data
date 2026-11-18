-- Threat: !InfrastructureShared
-- Name: 125d736b916b3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
TrackPidAndTechnique(l_0_0, "sim_tool", "safebreach")
return mp.CLEAN
