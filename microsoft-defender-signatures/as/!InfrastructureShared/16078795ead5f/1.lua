-- Threat: !InfrastructureShared
-- Name: 16078795ead5f
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
