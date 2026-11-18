-- Threat: !InfrastructureShared
-- Name: c0b34989f90d
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  TrackPidAndTechniqueBM("BM", "T1074", "DataStage")
  return mp.INFECTED
end
return mp.CLEAN
