-- Threat: !InfrastructureShared
-- Name: 3278e514ab3f
-- Type: 21

if peattributes.isexe == true and mp.get_mpattribute("pea_no_security") and mp.getfilesize() >= 10000000 then
  return mp.INFECTED
end
return mp.CLEAN
