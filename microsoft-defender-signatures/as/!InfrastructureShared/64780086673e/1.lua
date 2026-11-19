-- Threat: !InfrastructureShared
-- Name: 64780086673e
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
