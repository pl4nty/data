-- Threat: !InfrastructureShared
-- Name: 247861891e9b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
