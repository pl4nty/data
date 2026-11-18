-- Threat: !InfrastructureShared
-- Name: 103b3799c6e80
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = IsDetectionThresholdMet("BM")
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
