-- Threat: !InfrastructureShared
-- Name: 63785725b40c
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
