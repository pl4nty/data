-- Threat: !InfrastructureShared
-- Name: 2978da87a1a9
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
