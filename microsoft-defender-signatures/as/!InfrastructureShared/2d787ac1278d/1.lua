-- Threat: !InfrastructureShared
-- Name: 2d787ac1278d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
