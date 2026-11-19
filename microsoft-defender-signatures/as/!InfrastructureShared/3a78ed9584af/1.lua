-- Threat: !InfrastructureShared
-- Name: 3a78ed9584af
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") then
  return mp.INFECTED
end
return mp.CLEAN
