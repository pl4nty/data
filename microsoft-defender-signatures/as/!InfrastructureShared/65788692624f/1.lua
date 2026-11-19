-- Threat: !InfrastructureShared
-- Name: 65788692624f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
