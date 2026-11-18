-- Threat: !InfrastructureShared
-- Name: 347882131d2c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
