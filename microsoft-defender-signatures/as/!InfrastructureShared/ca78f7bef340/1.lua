-- Threat: !InfrastructureShared
-- Name: ca78f7bef340
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
