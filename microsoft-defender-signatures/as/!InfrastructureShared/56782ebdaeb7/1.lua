-- Threat: !InfrastructureShared
-- Name: 56782ebdaeb7
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
