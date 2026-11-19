-- Threat: !InfrastructureShared
-- Name: 99787c9cf53b
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 303104 then
  return mp.INFECTED
end
return mp.CLEAN
