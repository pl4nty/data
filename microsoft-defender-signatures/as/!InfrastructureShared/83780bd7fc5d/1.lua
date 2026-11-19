-- Threat: !InfrastructureShared
-- Name: 83780bd7fc5d
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
