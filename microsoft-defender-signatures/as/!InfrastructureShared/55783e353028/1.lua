-- Threat: !InfrastructureShared
-- Name: 55783e353028
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
