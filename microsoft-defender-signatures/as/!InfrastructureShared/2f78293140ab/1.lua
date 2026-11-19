-- Threat: !InfrastructureShared
-- Name: 2f78293140ab
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
