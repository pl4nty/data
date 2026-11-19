-- Threat: !InfrastructureShared
-- Name: 997811a4b9ab
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
