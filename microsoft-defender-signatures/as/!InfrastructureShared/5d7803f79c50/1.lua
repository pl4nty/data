-- Threat: !InfrastructureShared
-- Name: 5d7803f79c50
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
