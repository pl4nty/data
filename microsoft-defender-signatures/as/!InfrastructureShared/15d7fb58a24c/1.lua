-- Threat: !InfrastructureShared
-- Name: 15d7fb58a24c
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechnique("CMDHSTR", "T1560", "archive_collected_data")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.LOWFI
end
return mp.LOWFI
