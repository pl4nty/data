-- Threat: !InfrastructureShared
-- Name: bb786fe8c5d1
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
end
return mp.INFECTED
