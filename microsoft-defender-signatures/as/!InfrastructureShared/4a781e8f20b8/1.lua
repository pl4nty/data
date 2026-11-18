-- Threat: !InfrastructureShared
-- Name: 4a781e8f20b8
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
