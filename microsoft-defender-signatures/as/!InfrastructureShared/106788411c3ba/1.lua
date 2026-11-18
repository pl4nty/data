-- Threat: !InfrastructureShared
-- Name: 106788411c3ba
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
