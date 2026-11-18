-- Threat: !InfrastructureShared
-- Name: 887856fd21c6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
