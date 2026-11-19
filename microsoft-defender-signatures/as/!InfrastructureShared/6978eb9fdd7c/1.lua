-- Threat: !InfrastructureShared
-- Name: 6978eb9fdd7c
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
