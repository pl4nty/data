-- Threat: !InfrastructureShared
-- Name: 2778061c7f95
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
