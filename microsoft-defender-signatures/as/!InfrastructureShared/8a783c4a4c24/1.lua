-- Threat: !InfrastructureShared
-- Name: 8a783c4a4c24
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
