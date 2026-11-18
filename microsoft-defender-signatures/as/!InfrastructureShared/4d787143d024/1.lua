-- Threat: !InfrastructureShared
-- Name: 4d787143d024
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
