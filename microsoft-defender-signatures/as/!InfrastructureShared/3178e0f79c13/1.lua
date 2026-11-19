-- Threat: !InfrastructureShared
-- Name: 3178e0f79c13
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
