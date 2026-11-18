-- Threat: !InfrastructureShared
-- Name: 3278fd63e803
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
