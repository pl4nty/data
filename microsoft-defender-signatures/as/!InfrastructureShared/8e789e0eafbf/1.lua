-- Threat: !InfrastructureShared
-- Name: 8e789e0eafbf
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
