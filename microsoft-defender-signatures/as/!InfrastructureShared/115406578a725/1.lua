-- Threat: !InfrastructureShared
-- Name: 115406578a725
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
