-- Threat: !InfrastructureShared
-- Name: 2c782c6fec1e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
