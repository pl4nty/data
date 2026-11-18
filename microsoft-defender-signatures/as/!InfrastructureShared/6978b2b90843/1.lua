-- Threat: !InfrastructureShared
-- Name: 6978b2b90843
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
