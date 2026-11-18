-- Threat: !InfrastructureShared
-- Name: 16078aaea8c30
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
