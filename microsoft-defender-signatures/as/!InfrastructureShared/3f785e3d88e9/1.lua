-- Threat: !InfrastructureShared
-- Name: 3f785e3d88e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
