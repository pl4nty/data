-- Threat: !InfrastructureShared
-- Name: 15078bd565d4b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
