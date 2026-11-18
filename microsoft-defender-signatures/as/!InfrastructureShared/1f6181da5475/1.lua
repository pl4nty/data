-- Threat: !InfrastructureShared
-- Name: 1f6181da5475
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
end
return mp.INFECTED
