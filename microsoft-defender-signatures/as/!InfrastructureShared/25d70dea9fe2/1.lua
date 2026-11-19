-- Threat: !InfrastructureShared
-- Name: 25d70dea9fe2
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechnique("CMDHSTR", "T1560", "archive_collected_data")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.LOWFI
