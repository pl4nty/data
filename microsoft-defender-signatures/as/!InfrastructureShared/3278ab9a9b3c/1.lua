-- Threat: !InfrastructureShared
-- Name: 3278ab9a9b3c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
