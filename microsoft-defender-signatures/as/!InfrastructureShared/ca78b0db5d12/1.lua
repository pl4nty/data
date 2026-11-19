-- Threat: !InfrastructureShared
-- Name: ca78b0db5d12
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
