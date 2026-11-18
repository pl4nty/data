-- Threat: !InfrastructureShared
-- Name: ec78f0b13b30
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
