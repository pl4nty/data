-- Threat: !InfrastructureShared
-- Name: 71784b5eb494
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
