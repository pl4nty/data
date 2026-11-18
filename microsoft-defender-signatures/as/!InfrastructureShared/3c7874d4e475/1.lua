-- Threat: !InfrastructureShared
-- Name: 3c7874d4e475
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
