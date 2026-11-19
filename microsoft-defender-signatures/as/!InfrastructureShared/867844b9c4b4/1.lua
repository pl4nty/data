-- Threat: !InfrastructureShared
-- Name: 867844b9c4b4
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
