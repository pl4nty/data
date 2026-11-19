-- Threat: !InfrastructureShared
-- Name: 2c7880b6a0e8
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
