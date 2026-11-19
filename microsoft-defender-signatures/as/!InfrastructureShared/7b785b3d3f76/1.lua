-- Threat: !InfrastructureShared
-- Name: 7b785b3d3f76
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
