-- Threat: !InfrastructureShared
-- Name: c5402bb8b1c4
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 73728 and mp.getfilesize() < 98304 then
  return mp.INFECTED
end
return mp.CLEAN
