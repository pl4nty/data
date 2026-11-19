-- Threat: !InfrastructureShared
-- Name: 2c783eac55e7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
