-- Threat: !InfrastructureShared
-- Name: 15a61f6bafde8
-- Type: 21

if not mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
