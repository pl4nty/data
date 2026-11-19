-- Threat: !InfrastructureShared
-- Name: 9c61b6b775b6
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
