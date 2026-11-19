-- Threat: !InfrastructureShared
-- Name: 35b3f52fb447
-- Type: 21
-- Includes: TechniqueTracker

TrackPidAndTechniqueBM("BM", "T1056.001", "keylog")
if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
