-- Threat: !InfrastructureShared
-- Name: 3d3b3ed4fb0f6
-- Type: 21
-- Includes: BMLuaLib

if analyzeRansomwarePattern1() == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
