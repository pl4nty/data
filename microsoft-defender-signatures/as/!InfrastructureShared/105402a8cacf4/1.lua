-- Threat: !InfrastructureShared
-- Name: 105402a8cacf4
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
