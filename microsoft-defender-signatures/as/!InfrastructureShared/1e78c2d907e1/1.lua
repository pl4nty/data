-- Threat: !InfrastructureShared
-- Name: 1e78c2d907e1
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
