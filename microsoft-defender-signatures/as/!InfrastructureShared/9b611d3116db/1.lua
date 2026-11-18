-- Threat: !InfrastructureShared
-- Name: 9b611d3116db
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
