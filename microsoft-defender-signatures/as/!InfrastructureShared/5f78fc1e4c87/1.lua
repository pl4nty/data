-- Threat: !InfrastructureShared
-- Name: 5f78fc1e4c87
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
