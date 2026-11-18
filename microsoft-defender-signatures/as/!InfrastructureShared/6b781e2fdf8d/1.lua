-- Threat: !InfrastructureShared
-- Name: 6b781e2fdf8d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
