-- Threat: !InfrastructureShared
-- Name: 2c78d6e5e427
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
