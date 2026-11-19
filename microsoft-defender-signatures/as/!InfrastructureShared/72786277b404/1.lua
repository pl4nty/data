-- Threat: !InfrastructureShared
-- Name: 72786277b404
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
