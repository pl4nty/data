-- Threat: !InfrastructureShared
-- Name: a6782e0fed44
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.LOWFI
end
reportDetectedRegions()
return mp.INFECTED
