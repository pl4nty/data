-- Threat: !InfrastructureShared
-- Name: 3c789cbd5acf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
