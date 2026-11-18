-- Threat: !InfrastructureShared
-- Name: 14561242a32b5
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:NSIS.gen!A") then
  return mp.INFECTED
end
return mp.CLEAN
