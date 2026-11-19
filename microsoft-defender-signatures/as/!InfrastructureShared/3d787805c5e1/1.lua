-- Threat: !InfrastructureShared
-- Name: 3d787805c5e1
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
