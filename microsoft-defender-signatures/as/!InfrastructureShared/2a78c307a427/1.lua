-- Threat: !InfrastructureShared
-- Name: 2a78c307a427
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
