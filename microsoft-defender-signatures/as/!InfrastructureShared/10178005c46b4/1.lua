-- Threat: !InfrastructureShared
-- Name: 10178005c46b4
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
