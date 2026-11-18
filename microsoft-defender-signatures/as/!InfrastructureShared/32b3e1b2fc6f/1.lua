-- Threat: !InfrastructureShared
-- Name: 32b3e1b2fc6f
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
