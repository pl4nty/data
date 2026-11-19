-- Threat: !InfrastructureShared
-- Name: 4ecb3bf124b6e
-- Type: 21
-- Includes: BMLuaLib

if analyzeRansomwarePattern2() == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
