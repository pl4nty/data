-- Threat: !InfrastructureShared
-- Name: 6341e253aa3e
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
