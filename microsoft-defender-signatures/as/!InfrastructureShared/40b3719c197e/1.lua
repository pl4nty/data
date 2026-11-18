-- Threat: !InfrastructureShared
-- Name: 40b3719c197e
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  TrackPidAndTechniqueBM("BM", "T1074", "DataStage")
  return mp.INFECTED
end
return mp.CLEAN
