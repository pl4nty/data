-- Threat: !InfrastructureShared
-- Name: 2f78a9c1a804
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
