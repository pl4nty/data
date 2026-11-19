-- Threat: !InfrastructureShared
-- Name: 21a784df4d2d2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
