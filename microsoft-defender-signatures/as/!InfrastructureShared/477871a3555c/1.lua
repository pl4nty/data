-- Threat: !InfrastructureShared
-- Name: 477871a3555c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
