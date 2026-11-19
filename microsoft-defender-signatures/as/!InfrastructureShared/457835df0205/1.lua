-- Threat: !InfrastructureShared
-- Name: 457835df0205
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
