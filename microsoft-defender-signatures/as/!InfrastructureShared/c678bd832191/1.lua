-- Threat: !InfrastructureShared
-- Name: c678bd832191
-- Type: 21

if mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
