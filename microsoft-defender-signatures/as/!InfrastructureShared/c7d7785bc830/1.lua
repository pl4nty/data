-- Threat: !InfrastructureShared
-- Name: c7d7785bc830
-- Type: 21
-- Includes: HstrLuaLib

if isTamperProtectionOn() then
  return mp.INFECTED
end
return mp.LOWFI
