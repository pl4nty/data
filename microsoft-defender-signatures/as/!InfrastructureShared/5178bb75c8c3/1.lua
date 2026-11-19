-- Threat: !InfrastructureShared
-- Name: 5178bb75c8c3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
