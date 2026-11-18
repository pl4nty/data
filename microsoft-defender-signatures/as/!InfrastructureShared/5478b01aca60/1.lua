-- Threat: !InfrastructureShared
-- Name: 5478b01aca60
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
