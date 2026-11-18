-- Threat: !InfrastructureShared
-- Name: 307b350a60e00
-- Type: 21
-- Includes: TechniqueTracker

local l_0_0 = IsDetectionThresholdMet("BM")
if l_0_0 then
  return mp.INFECTED
end
return mp.CLEAN
