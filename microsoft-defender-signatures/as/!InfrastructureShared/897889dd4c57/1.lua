-- Threat: !InfrastructureShared
-- Name: 897889dd4c57
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
