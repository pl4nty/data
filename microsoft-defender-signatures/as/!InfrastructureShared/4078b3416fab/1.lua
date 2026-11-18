-- Threat: !InfrastructureShared
-- Name: 4078b3416fab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
