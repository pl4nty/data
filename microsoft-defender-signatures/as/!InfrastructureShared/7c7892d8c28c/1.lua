-- Threat: !InfrastructureShared
-- Name: 7c7892d8c28c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
