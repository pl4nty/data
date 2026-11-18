-- Threat: !InfrastructureShared
-- Name: b7788bfe1079
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
