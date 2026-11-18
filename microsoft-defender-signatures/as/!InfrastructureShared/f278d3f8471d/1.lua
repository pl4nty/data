-- Threat: !InfrastructureShared
-- Name: f278d3f8471d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
