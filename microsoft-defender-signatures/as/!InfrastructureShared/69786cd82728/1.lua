-- Threat: !InfrastructureShared
-- Name: 69786cd82728
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
