-- Threat: !InfrastructureShared
-- Name: 845b351d1a26c
-- Type: 21
-- Includes: BMLuaLib

if analyzeRansomwarePattern4() == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
