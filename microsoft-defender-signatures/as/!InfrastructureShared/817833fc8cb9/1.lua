-- Threat: !InfrastructureShared
-- Name: 817833fc8cb9
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_no_exports") and mp.get_mpattribute("pea_no_tls") then
  return mp.INFECTED
end
return mp.CLEAN
