-- Threat: !InfrastructureShared
-- Name: 6478415d1547
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
