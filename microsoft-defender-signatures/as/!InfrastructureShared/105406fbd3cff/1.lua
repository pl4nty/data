-- Threat: !InfrastructureShared
-- Name: 105406fbd3cff
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
