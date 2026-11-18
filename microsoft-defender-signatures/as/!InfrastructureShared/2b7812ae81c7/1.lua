-- Threat: !InfrastructureShared
-- Name: 2b7812ae81c7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
