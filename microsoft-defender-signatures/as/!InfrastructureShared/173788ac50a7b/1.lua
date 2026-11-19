-- Threat: !InfrastructureShared
-- Name: 173788ac50a7b
-- Type: 21

if mp.get_mpattribute("pea_hasexports") and mp.get_mpattribute("pea_no_boundimport") and not mp.get_mpattribute("pea_no_tls") then
  return mp.INFECTED
end
return mp.CLEAN
