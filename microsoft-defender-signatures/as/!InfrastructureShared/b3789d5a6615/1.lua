-- Threat: !InfrastructureShared
-- Name: b3789d5a6615
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
