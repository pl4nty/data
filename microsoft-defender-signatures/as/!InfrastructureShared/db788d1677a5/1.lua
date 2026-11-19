-- Threat: !InfrastructureShared
-- Name: db788d1677a5
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
