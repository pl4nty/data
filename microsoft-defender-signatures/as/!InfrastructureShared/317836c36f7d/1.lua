-- Threat: !InfrastructureShared
-- Name: 317836c36f7d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
