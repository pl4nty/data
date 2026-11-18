-- Threat: !InfrastructureShared
-- Name: 7b78d27721d5
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
