-- Threat: !InfrastructureShared
-- Name: 2c789ede38f2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
