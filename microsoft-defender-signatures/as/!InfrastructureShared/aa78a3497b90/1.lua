-- Threat: !InfrastructureShared
-- Name: aa78a3497b90
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
