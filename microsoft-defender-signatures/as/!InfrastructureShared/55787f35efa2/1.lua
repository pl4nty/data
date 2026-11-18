-- Threat: !InfrastructureShared
-- Name: 55787f35efa2
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
