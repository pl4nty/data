-- Threat: !InfrastructureShared
-- Name: 10fb34a88018b
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
