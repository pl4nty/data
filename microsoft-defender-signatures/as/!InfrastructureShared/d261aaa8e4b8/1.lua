-- Threat: !InfrastructureShared
-- Name: d261aaa8e4b8
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 315392 and mp.getfilesize() < 327680 then
  return mp.INFECTED
end
return mp.CLEAN
