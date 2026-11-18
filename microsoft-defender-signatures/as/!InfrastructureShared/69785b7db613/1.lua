-- Threat: !InfrastructureShared
-- Name: 69785b7db613
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
