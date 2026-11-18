-- Threat: !InfrastructureShared
-- Name: 6eb3063fefbd
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  TrackPidAndTechniqueBM("BM", "T1562.004", "disablefirewall")
  return mp.INFECTED
end
return mp.CLEAN
