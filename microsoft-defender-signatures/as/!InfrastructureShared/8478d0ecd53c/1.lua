-- Threat: !InfrastructureShared
-- Name: 8478d0ecd53c
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
