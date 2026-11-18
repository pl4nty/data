-- Threat: !InfrastructureShared
-- Name: 6b78750a888e
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.LOWFI
end
reportDetectedRegions()
return mp.INFECTED
