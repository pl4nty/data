-- Threat: !InfrastructureShared
-- Name: 7778d2bba0fe
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
