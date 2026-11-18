-- Threat: !InfrastructureShared
-- Name: 3878b68c36dc
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
