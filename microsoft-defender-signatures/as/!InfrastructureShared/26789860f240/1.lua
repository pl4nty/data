-- Threat: !InfrastructureShared
-- Name: 26789860f240
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
