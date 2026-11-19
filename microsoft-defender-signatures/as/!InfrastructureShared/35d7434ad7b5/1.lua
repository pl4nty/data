-- Threat: !InfrastructureShared
-- Name: 35d7434ad7b5
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechnique("CMDHSTR", "T1018", "remote_system_discovery")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
