-- Threat: !InfrastructureShared
-- Name: 2c78fe8bdb86
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
