-- Threat: !InfrastructureShared
-- Name: 3d7804e690d1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
