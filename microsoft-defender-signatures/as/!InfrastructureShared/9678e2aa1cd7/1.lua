-- Threat: !InfrastructureShared
-- Name: 9678e2aa1cd7
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
