-- Threat: !InfrastructureShared
-- Name: 5678f9d8eb7b
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
