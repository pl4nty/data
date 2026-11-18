-- Threat: !InfrastructureShared
-- Name: 5d7802e782fe
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
