-- Threat: !InfrastructureShared
-- Name: ca78e490a73f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
