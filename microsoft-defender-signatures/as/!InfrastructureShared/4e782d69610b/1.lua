-- Threat: !InfrastructureShared
-- Name: 4e782d69610b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
