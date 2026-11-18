-- Threat: !InfrastructureShared
-- Name: ec78fbe69b8c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
