-- Threat: !InfrastructureShared
-- Name: 39781c75dfec
-- Type: 21
-- Includes: HstrLuaLib

if mp.GetHSTRCallerId() == mp.HSTR_CALLER_SMS then
  reportDetectedRegions()
  return mp.INFECTED
end
if peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
