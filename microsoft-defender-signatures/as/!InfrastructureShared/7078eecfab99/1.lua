-- Threat: !InfrastructureShared
-- Name: 7078eecfab99
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
