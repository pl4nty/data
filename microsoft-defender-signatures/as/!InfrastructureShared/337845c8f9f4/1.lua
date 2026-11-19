-- Threat: !InfrastructureShared
-- Name: 337845c8f9f4
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
