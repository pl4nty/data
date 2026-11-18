-- Threat: !InfrastructureShared
-- Name: 7e784cba0bdd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
