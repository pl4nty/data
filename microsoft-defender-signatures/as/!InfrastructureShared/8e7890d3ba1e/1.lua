-- Threat: !InfrastructureShared
-- Name: 8e7890d3ba1e
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
