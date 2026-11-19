-- Threat: !InfrastructureShared
-- Name: 5a7803859e75
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
