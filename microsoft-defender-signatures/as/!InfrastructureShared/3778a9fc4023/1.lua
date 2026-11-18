-- Threat: !InfrastructureShared
-- Name: 3778a9fc4023
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
