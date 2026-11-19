-- Threat: !InfrastructureShared
-- Name: 3f78189fdf55
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
