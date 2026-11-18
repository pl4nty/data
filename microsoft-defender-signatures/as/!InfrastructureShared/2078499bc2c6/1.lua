-- Threat: !InfrastructureShared
-- Name: 2078499bc2c6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
