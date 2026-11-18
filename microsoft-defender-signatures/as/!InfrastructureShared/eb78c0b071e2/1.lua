-- Threat: !InfrastructureShared
-- Name: eb78c0b071e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
