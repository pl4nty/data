-- Threat: !InfrastructureShared
-- Name: 8540c30d6693
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
