-- Threat: !InfrastructureShared
-- Name: 8b78ed5141a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
