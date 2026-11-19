-- Threat: !InfrastructureShared
-- Name: 717815ae1cc7
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
