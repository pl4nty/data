-- Threat: !InfrastructureShared
-- Name: 56d7e3a68920
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechnique("CMDHSTR", "T1082", "system_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
