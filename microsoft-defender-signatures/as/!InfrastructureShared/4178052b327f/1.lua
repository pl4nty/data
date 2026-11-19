-- Threat: !InfrastructureShared
-- Name: 4178052b327f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
