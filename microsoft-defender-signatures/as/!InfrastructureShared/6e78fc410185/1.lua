-- Threat: !InfrastructureShared
-- Name: 6e78fc410185
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
