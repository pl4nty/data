-- Threat: !InfrastructureShared
-- Name: 4878a8bdcdb7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
