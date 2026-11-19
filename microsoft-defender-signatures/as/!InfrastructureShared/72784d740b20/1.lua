-- Threat: !InfrastructureShared
-- Name: 72784d740b20
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
