-- Threat: !InfrastructureShared
-- Name: 5e783c81cb5b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
