-- Threat: !InfrastructureShared
-- Name: 1fd7bc9c7065
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechnique("CMDHSTR", "T1560", "archive_collected_data")
if IsDetectionThresholdMet("CMDHSTR") then
  return mp.INFECTED
end
return mp.LOWFI
