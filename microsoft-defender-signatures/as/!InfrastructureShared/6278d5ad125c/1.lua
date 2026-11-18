-- Threat: !InfrastructureShared
-- Name: 6278d5ad125c
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
