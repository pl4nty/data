-- Threat: !InfrastructureShared
-- Name: 2361d6c2c31c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
