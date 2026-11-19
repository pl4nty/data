-- Threat: !InfrastructureShared
-- Name: 12378a681eb6d
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
