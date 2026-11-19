-- Threat: !InfrastructureShared
-- Name: 5d78fc2d164a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
