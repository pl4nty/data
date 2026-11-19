-- Threat: !InfrastructureShared
-- Name: 7178b1cde7fe
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
