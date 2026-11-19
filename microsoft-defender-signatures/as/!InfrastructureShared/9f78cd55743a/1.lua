-- Threat: !InfrastructureShared
-- Name: 9f78cd55743a
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
