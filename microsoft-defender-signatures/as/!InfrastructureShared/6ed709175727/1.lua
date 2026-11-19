-- Threat: !InfrastructureShared
-- Name: 6ed709175727
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
TrackPidAndTechnique(l_0_0, "T1562.001", "mptamper_avastdriver")
return mp.INFECTED
