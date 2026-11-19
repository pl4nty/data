-- Threat: !InfrastructureShared
-- Name: 3e7877d11d9a
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 327680 and mp.getfilesize() < 557056 then
  return mp.INFECTED
end
return mp.CLEAN
