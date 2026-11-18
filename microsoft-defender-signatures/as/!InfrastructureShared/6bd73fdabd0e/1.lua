-- Threat: !InfrastructureShared
-- Name: 6bd73fdabd0e
-- Type: 21
-- Includes: HstrLuaLib

if not isTamperProtectionOn() then
  return mp.LOWFI
end
return mp.INFECTED
