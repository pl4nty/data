-- Threat: !InfrastructureShared
-- Name: 2f7874468d24
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
