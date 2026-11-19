-- Threat: !InfrastructureShared
-- Name: 3f78015b6d8b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
