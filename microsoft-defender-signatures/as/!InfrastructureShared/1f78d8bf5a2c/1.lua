-- Threat: !InfrastructureShared
-- Name: 1f78d8bf5a2c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
