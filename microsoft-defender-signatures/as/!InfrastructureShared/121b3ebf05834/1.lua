-- Threat: !InfrastructureShared
-- Name: 121b3ebf05834
-- Type: 21
-- Includes: BMLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.CLEAN
