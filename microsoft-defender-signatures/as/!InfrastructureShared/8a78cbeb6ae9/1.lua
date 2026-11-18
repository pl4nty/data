-- Threat: !InfrastructureShared
-- Name: 8a78cbeb6ae9
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
