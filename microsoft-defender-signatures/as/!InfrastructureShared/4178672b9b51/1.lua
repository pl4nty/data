-- Threat: !InfrastructureShared
-- Name: 4178672b9b51
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("HSTR:GolangBinary") then
  return mp.INFECTED
end
return mp.CLEAN
