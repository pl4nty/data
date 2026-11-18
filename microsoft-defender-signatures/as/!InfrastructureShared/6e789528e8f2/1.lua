-- Threat: !InfrastructureShared
-- Name: 6e789528e8f2
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
