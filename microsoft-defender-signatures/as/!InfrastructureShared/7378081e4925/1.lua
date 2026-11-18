-- Threat: !InfrastructureShared
-- Name: 7378081e4925
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
