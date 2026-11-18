-- Threat: !InfrastructureShared
-- Name: 142780d9fd4a6
-- Type: 21

if not mp.get_mpattribute("pea_ismsil") then
  return mp.CLEAN
end
return mp.INFECTED
