-- Threat: !InfrastructureShared
-- Name: e6781c3eb158
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
end
return mp.INFECTED
