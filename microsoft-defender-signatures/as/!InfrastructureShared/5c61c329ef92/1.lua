-- Threat: !InfrastructureShared
-- Name: 5c61c329ef92
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
