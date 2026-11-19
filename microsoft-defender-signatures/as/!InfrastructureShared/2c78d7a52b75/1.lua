-- Threat: !InfrastructureShared
-- Name: 2c78d7a52b75
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
