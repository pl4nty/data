-- Threat: !InfrastructureShared
-- Name: 28441c49cc9dc
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 69632 and mp.getfilesize() < 94208 then
  return mp.INFECTED
end
return mp.CLEAN
