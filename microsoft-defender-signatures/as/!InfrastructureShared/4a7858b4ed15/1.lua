-- Threat: !InfrastructureShared
-- Name: 4a7858b4ed15
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
