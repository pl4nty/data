-- Threat: !InfrastructureShared
-- Name: 32b369bc936f
-- Type: 21
-- Includes: TechniqueTracker

if IsDetectionThresholdMet("BM") then
  return mp.INFECTED
end
return mp.CLEAN
