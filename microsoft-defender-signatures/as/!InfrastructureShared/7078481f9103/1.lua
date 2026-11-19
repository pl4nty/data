-- Threat: !InfrastructureShared
-- Name: 7078481f9103
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
