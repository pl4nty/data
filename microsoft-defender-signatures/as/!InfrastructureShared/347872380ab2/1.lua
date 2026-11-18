-- Threat: !InfrastructureShared
-- Name: 347872380ab2
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
