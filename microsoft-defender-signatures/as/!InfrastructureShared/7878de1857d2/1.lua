-- Threat: !InfrastructureShared
-- Name: 7878de1857d2
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 442368 and mp.getfilesize() < 466944 then
  return mp.INFECTED
end
return mp.CLEAN
