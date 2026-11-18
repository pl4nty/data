-- Threat: !InfrastructureShared
-- Name: 5878fe280ead
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
