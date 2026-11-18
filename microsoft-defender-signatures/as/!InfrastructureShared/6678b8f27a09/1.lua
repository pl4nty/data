-- Threat: !InfrastructureShared
-- Name: 6678b8f27a09
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
reportDetectedRegions()
return mp.INFECTED
