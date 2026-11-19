-- Threat: !InfrastructureShared
-- Name: 50b3392cff50
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
