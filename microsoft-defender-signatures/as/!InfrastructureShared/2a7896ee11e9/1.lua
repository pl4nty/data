-- Threat: !InfrastructureShared
-- Name: 2a7896ee11e9
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
