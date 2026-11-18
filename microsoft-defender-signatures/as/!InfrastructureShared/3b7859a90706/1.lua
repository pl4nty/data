-- Threat: !InfrastructureShared
-- Name: 3b7859a90706
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") then
  return mp.INFECTED
end
return mp.CLEAN
