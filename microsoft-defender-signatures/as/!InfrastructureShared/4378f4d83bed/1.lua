-- Threat: !InfrastructureShared
-- Name: 4378f4d83bed
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
