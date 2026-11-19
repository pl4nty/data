-- Threat: !InfrastructureShared
-- Name: dc780043b99c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
