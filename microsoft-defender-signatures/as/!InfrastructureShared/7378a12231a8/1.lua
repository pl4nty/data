-- Threat: !InfrastructureShared
-- Name: 7378a12231a8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
