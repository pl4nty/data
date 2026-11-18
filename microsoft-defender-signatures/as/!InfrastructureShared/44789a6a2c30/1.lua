-- Threat: !InfrastructureShared
-- Name: 44789a6a2c30
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
