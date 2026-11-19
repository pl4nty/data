-- Threat: !InfrastructureShared
-- Name: 32b35d3fd034
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
