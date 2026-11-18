-- Threat: !InfrastructureShared
-- Name: 7878dd644e03
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
