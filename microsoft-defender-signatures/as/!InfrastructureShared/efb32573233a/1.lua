-- Threat: !InfrastructureShared
-- Name: efb32573233a
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
