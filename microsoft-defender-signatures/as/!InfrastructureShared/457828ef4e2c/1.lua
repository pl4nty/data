-- Threat: !InfrastructureShared
-- Name: 457828ef4e2c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
