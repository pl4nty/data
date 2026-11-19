-- Threat: !InfrastructureShared
-- Name: 7678db0af4e0
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
