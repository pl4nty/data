-- Threat: !InfrastructureShared
-- Name: 4c7808a8d07f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
