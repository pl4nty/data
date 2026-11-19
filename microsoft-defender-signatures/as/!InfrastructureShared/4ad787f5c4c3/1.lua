-- Threat: !InfrastructureShared
-- Name: 4ad787f5c4c3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
TrackPidAndTechnique(l_0_0, "sim_tool", "redcanary")
return mp.CLEAN
