-- Threat: !InfrastructureShared
-- Name: 4d78bb3d20ac
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
