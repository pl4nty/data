-- Threat: !InfrastructureShared
-- Name: 2c785b4ac3c2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
