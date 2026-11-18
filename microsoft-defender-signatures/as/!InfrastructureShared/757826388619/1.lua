-- Threat: !InfrastructureShared
-- Name: 757826388619
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() ~= mp.HSTR_CALLER_SMS then
  return mp.CLEAN
end
reportDetectedRegions()
return mp.INFECTED
