-- Threat: !InfrastructureShared
-- Name: 47780c0f7b41
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") and mp.getfilesize() < 36864 then
  return mp.INFECTED
end
return mp.CLEAN
