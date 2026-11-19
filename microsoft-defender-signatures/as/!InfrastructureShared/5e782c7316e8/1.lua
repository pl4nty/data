-- Threat: !InfrastructureShared
-- Name: 5e782c7316e8
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
