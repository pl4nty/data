-- Threat: !InfrastructureShared
-- Name: 10d7881b71a9d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
