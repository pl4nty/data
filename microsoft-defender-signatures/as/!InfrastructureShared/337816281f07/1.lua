-- Threat: !InfrastructureShared
-- Name: 337816281f07
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 327680 and mp.getfilesize() < 557056 then
  return mp.INFECTED
end
return mp.CLEAN
