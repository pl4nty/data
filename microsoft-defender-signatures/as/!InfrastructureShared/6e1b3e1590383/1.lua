-- Threat: !InfrastructureShared
-- Name: 6e1b3e1590383
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
