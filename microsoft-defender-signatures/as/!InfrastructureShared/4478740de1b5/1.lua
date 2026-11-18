-- Threat: !InfrastructureShared
-- Name: 4478740de1b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
