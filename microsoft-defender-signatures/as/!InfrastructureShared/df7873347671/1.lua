-- Threat: !InfrastructureShared
-- Name: df7873347671
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
