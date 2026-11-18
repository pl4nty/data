-- Threat: !InfrastructureShared
-- Name: 8e78361cc4bd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
