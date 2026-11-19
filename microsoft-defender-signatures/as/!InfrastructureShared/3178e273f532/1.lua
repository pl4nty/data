-- Threat: !InfrastructureShared
-- Name: 3178e273f532
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
