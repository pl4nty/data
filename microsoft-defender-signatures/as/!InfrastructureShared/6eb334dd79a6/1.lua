-- Threat: !InfrastructureShared
-- Name: 6eb334dd79a6
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  TrackPidAndTechniqueBM("BM", "T1562.004", "disablefirewall")
  return mp.INFECTED
end
return mp.CLEAN
