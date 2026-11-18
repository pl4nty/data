-- Threat: !InfrastructureShared
-- Name: 3c78216468c2
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
