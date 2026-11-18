-- Threat: !InfrastructureShared
-- Name: 2f1b32559221a
-- Type: 21
-- Includes: BMLuaLib

if analyzeRansomwarePattern4() == mp.INFECTED then
  return mp.INFECTED
end
return mp.CLEAN
