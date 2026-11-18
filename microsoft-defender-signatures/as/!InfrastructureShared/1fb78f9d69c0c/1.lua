-- Threat: !InfrastructureShared
-- Name: 1fb78f9d69c0c
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
