-- Threat: !InfrastructureShared
-- Name: 8e787092f7e5
-- Type: 21

if mp.get_mpattribute("pea_ismsil") and mp.get_mpattribute("pea_isdll") then
  return mp.INFECTED
end
return mp.CLEAN
