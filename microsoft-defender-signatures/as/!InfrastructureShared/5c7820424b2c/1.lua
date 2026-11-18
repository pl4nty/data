-- Threat: !InfrastructureShared
-- Name: 5c7820424b2c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
