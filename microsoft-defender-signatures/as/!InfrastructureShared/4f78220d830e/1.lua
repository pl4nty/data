-- Threat: !InfrastructureShared
-- Name: 4f78220d830e
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
