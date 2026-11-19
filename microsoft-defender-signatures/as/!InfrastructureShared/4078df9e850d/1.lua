-- Threat: !InfrastructureShared
-- Name: 4078df9e850d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
