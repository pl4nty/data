-- Threat: !InfrastructureShared
-- Name: 38788bce0a04
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
