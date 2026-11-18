-- Threat: !InfrastructureShared
-- Name: 7278a9549896
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
