-- Threat: !InfrastructureShared
-- Name: 3b78d02634e2
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
reportDetectedRegions()
return mp.INFECTED
