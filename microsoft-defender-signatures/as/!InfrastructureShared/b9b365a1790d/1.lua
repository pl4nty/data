-- Threat: !InfrastructureShared
-- Name: b9b365a1790d
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
