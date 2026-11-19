-- Threat: !InfrastructureShared
-- Name: 4e7851279d3f
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
