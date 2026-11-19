-- Threat: !InfrastructureShared
-- Name: 9978ed197576
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
