-- Threat: !InfrastructureShared
-- Name: 8eb368048414
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  add_parents()
  return mp.INFECTED
end
return mp.CLEAN
