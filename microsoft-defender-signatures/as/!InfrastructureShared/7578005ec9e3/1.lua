-- Threat: !InfrastructureShared
-- Name: 7578005ec9e3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
