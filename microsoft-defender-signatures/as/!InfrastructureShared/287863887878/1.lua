-- Threat: !InfrastructureShared
-- Name: 287863887878
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
