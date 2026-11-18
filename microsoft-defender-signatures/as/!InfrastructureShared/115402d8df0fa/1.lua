-- Threat: !InfrastructureShared
-- Name: 115402d8df0fa
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
