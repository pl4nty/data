-- Threat: !InfrastructureShared
-- Name: 457b348986ae0
-- Type: 21
-- Includes: BMLuaLib

if analyzeRansomwarePattern2() == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
