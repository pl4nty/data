-- Threat: !InfrastructureShared
-- Name: ca78eb0de9ec
-- Type: 21

if peattributes.ismsil or mp.get_mpattribute("pea_ismsil") then
  return mp.INFECTED
end
return mp.CLEAN
