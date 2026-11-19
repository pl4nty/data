-- Threat: !InfrastructureShared
-- Name: 2f78c7ef52bf
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
