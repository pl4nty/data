-- Threat: !InfrastructureShared
-- Name: 11878f7b09479
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
reportDetectedRegions()
return mp.INFECTED
