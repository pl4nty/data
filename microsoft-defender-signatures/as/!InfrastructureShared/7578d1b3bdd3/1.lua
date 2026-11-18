-- Threat: !InfrastructureShared
-- Name: 7578d1b3bdd3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
