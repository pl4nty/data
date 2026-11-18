-- Threat: !InfrastructureShared
-- Name: 7378853d6f76
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
