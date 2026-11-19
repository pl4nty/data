-- Threat: !InfrastructureShared
-- Name: 32b30016cc78
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
