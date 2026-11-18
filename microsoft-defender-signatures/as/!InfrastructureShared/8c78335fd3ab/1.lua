-- Threat: !InfrastructureShared
-- Name: 8c78335fd3ab
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
