-- Threat: !InfrastructureShared
-- Name: 6761f149e36b
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
end
return mp.INFECTED
