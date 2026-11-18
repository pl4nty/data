-- Threat: !InfrastructureShared
-- Name: 387847a03374
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
