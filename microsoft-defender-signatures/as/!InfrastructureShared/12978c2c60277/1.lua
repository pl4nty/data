-- Threat: !InfrastructureShared
-- Name: 12978c2c60277
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
