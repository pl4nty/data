-- Threat: !InfrastructureShared
-- Name: 9c78bf782c3c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
