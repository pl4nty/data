-- Threat: !InfrastructureShared
-- Name: cd41fee819ca
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() >= 12288 and mp.getfilesize() < 36864 then
  return mp.INFECTED
end
return mp.CLEAN
