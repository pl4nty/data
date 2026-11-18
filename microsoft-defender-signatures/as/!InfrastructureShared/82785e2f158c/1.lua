-- Threat: !InfrastructureShared
-- Name: 82785e2f158c
-- Type: 21

if mp.get_mpattribute("pea_has_msilresources") then
  return mp.INFECTED
end
return mp.CLEAN
