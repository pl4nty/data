-- Threat: !InfrastructureShared
-- Name: 93786a674956
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
