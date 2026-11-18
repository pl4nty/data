-- Threat: !InfrastructureShared
-- Name: 11c61da0c2f87
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
