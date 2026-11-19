-- Threat: !InfrastructureShared
-- Name: f0787025462a
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
