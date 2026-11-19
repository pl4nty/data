-- Threat: !InfrastructureShared
-- Name: 23fb33159fae3
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
