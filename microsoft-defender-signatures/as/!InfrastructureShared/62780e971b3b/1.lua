-- Threat: !InfrastructureShared
-- Name: 62780e971b3b
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
