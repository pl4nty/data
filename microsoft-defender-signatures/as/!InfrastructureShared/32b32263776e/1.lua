-- Threat: !InfrastructureShared
-- Name: 32b32263776e
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
