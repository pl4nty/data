-- Threat: !InfrastructureShared
-- Name: 32b3a3cabbf9
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
