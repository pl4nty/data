-- Threat: !InfrastructureShared
-- Name: 65404be96683
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
