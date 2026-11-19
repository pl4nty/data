-- Threat: !InfrastructureShared
-- Name: 5078b5ad3252
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
