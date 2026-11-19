-- Threat: !InfrastructureShared
-- Name: d47838e2209f
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_security") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() < 5376 then
  return mp.INFECTED
end
return mp.CLEAN
