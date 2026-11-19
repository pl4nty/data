-- Threat: !InfrastructureShared
-- Name: 4a78a58a5c2b
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
