-- Threat: !InfrastructureShared
-- Name: 1ae7876bdd593
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
