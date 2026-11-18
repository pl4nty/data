-- Threat: !InfrastructureShared
-- Name: 5678a3494a95
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.LOWFI
end
reportDetectedRegions()
return mp.INFECTED
