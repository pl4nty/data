-- Threat: !InfrastructureShared
-- Name: 75b3884fcae4
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  TrackPidAndTechniqueBM("BM", "T1059", "commandscriptthreshold")
  return mp.INFECTED
end
return mp.CLEAN
