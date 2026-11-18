-- Threat: !InfrastructureShared
-- Name: 5c780e26ae5d
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
