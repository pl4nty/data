-- Threat: !InfrastructureShared
-- Name: 3178385b36d5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
