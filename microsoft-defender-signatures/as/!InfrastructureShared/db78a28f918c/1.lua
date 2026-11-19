-- Threat: !InfrastructureShared
-- Name: db78a28f918c
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 20480 then
  return mp.INFECTED
end
return mp.CLEAN
