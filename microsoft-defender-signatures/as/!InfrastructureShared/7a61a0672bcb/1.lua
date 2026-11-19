-- Threat: !InfrastructureShared
-- Name: 7a61a0672bcb
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
