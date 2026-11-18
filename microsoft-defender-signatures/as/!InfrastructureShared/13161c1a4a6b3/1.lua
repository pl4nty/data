-- Threat: !InfrastructureShared
-- Name: 13161c1a4a6b3
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
end
return mp.INFECTED
