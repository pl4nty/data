-- Threat: !InfrastructureShared
-- Name: 3278d9043d54
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
