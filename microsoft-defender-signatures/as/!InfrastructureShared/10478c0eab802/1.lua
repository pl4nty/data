-- Threat: !InfrastructureShared
-- Name: 10478c0eab802
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
