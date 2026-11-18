-- Threat: !InfrastructureShared
-- Name: 22784492bf3f
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
