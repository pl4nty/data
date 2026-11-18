-- Threat: !InfrastructureShared
-- Name: 4d5b36c354cc3
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = IsDetectionThresholdMet("BM")
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
