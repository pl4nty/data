-- Threat: !InfrastructureShared
-- Name: 115400c2c5d96
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
