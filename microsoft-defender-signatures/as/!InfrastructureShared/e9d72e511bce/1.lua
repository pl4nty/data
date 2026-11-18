-- Threat: !InfrastructureShared
-- Name: e9d72e511bce
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = GetRealPidForScenario("CMDHSTR")
TrackPidAndTechnique(l_0_0, "T1562.001", "mptamper_mse7")
if IsDetectionThresholdMet(l_0_0) then
  return mp.INFECTED
end
return mp.LOWFI
