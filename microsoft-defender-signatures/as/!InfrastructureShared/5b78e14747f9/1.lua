-- Threat: !InfrastructureShared
-- Name: 5b78e14747f9
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
