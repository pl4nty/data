-- Threat: !InfrastructureShared
-- Name: 9878d54650e2
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
