-- Threat: !InfrastructureShared
-- Name: 2678e8dd82f4
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
