-- Threat: !InfrastructureShared
-- Name: 30788289f812
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
