-- Threat: !InfrastructureShared
-- Name: 32786541f9a7
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
