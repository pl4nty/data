-- Threat: !InfrastructureShared
-- Name: 74784bf59f7a
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
