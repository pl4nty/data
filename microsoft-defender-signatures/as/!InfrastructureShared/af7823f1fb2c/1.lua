-- Threat: !InfrastructureShared
-- Name: af7823f1fb2c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
