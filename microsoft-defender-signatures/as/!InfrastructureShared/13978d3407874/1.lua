-- Threat: !InfrastructureShared
-- Name: 13978d3407874
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
