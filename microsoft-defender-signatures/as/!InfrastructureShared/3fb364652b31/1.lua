-- Threat: !InfrastructureShared
-- Name: 3fb364652b31
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
