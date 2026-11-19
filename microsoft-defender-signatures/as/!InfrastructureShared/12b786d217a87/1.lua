-- Threat: !InfrastructureShared
-- Name: 12b786d217a87
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
