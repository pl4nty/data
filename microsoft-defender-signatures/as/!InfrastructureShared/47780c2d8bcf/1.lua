-- Threat: !InfrastructureShared
-- Name: 47780c2d8bcf
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
