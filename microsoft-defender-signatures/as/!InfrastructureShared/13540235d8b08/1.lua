-- Threat: !InfrastructureShared
-- Name: 13540235d8b08
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
