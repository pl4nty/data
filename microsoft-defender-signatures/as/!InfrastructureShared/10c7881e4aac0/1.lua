-- Threat: !InfrastructureShared
-- Name: 10c7881e4aac0
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
