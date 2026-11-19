-- Threat: !InfrastructureShared
-- Name: 4d7b34f89178e
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
