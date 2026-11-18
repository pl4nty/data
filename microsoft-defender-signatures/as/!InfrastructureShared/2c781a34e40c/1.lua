-- Threat: !InfrastructureShared
-- Name: 2c781a34e40c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
