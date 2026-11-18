-- Threat: !InfrastructureShared
-- Name: 32b36a7c8d54
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
