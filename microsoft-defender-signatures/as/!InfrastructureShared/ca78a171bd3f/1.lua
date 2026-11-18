-- Threat: !InfrastructureShared
-- Name: ca78a171bd3f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
