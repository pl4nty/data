-- Threat: !InfrastructureShared
-- Name: 21540c4a86a65
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
