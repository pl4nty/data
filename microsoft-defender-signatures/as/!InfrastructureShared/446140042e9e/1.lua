-- Threat: !InfrastructureShared
-- Name: 446140042e9e
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
