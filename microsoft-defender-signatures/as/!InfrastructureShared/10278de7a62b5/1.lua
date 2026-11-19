-- Threat: !InfrastructureShared
-- Name: 10278de7a62b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
