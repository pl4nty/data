-- Threat: !InfrastructureShared
-- Name: 11540060bc2c1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
