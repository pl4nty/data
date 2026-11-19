-- Threat: !InfrastructureShared
-- Name: 6978058834b5
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
