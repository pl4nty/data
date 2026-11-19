-- Threat: !InfrastructureShared
-- Name: 59d76fb16688
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = mp.GetScannedPPID()
TrackPidAndTechnique(l_0_0, "sim_tool", "picus")
return mp.CLEAN
