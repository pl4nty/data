-- Threat: !InfrastructureShared
-- Name: c5787408057f
-- Type: 21

if mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 98304 and mp.getfilesize() < 126976 then
  return mp.INFECTED
end
return mp.CLEAN
