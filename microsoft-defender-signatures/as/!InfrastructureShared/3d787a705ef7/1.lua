-- Threat: !InfrastructureShared
-- Name: 3d787a705ef7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
