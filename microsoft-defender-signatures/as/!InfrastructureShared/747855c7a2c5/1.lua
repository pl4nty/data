-- Threat: !InfrastructureShared
-- Name: 747855c7a2c5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
