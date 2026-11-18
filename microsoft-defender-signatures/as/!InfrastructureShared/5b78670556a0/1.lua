-- Threat: !InfrastructureShared
-- Name: 5b78670556a0
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 20480 then
  return mp.INFECTED
end
return mp.CLEAN
