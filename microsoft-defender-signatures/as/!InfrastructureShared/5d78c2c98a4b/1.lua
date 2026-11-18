-- Threat: !InfrastructureShared
-- Name: 5d78c2c98a4b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
