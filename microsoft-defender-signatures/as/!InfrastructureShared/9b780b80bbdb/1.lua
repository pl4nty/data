-- Threat: !InfrastructureShared
-- Name: 9b780b80bbdb
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
