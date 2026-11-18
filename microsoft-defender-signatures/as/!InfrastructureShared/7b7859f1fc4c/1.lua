-- Threat: !InfrastructureShared
-- Name: 7b7859f1fc4c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
