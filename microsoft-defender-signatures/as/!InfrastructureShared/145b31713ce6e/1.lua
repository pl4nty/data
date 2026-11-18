-- Threat: !InfrastructureShared
-- Name: 145b31713ce6e
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = IsDetectionThresholdMet("BM")
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
