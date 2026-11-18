-- Threat: !InfrastructureShared
-- Name: 6778f4cf12d0
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
