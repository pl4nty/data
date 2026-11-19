-- Threat: !InfrastructureShared
-- Name: 5478ffe63dee
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
