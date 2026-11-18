-- Threat: !InfrastructureShared
-- Name: 115403d9b6a7b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
