-- Threat: !InfrastructureShared
-- Name: 12178896d04cc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
