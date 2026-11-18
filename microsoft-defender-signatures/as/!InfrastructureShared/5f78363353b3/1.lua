-- Threat: !InfrastructureShared
-- Name: 5f78363353b3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
