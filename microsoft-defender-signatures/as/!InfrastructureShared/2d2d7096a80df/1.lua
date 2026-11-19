-- Threat: !InfrastructureShared
-- Name: 2d2d7096a80df
-- Type: 21
-- Includes: HstrLuaLib

if not isTamperProtectionOn() then
  return mp.LOWFI
end
return mp.INFECTED
