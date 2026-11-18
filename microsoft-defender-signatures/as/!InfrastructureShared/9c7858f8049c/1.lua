-- Threat: !InfrastructureShared
-- Name: 9c7858f8049c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
