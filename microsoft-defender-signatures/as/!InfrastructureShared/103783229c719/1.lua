-- Threat: !InfrastructureShared
-- Name: 103783229c719
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
