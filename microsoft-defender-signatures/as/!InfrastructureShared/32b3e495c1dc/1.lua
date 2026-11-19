-- Threat: !InfrastructureShared
-- Name: 32b3e495c1dc
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
