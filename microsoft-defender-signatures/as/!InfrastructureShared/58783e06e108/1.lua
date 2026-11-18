-- Threat: !InfrastructureShared
-- Name: 58783e06e108
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
