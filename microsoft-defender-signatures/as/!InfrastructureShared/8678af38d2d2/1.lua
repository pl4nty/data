-- Threat: !InfrastructureShared
-- Name: 8678af38d2d2
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
