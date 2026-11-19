-- Threat: !InfrastructureShared
-- Name: 9f78904e45d1
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
