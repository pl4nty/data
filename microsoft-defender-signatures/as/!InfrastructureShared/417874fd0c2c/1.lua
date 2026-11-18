-- Threat: !InfrastructureShared
-- Name: 417874fd0c2c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
