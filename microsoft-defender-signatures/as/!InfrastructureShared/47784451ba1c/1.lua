-- Threat: !InfrastructureShared
-- Name: 47784451ba1c
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
