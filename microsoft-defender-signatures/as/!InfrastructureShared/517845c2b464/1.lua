-- Threat: !InfrastructureShared
-- Name: 517845c2b464
-- Type: 21

if mp.get_mpattribute("pea_no_security") and mp.getfilesize() < 18944 then
  return mp.INFECTED
end
return mp.CLEAN
