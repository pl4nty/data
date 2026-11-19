-- Threat: !InfrastructureShared
-- Name: 317835482fbe
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
