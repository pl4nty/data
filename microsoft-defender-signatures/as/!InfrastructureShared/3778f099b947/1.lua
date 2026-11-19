-- Threat: !InfrastructureShared
-- Name: 3778f099b947
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
