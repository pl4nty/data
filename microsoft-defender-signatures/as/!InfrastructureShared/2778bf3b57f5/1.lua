-- Threat: !InfrastructureShared
-- Name: 2778bf3b57f5
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
