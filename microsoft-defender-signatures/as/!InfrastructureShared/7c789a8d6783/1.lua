-- Threat: !InfrastructureShared
-- Name: 7c789a8d6783
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
