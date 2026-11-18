-- Threat: !InfrastructureShared
-- Name: 8778262055dc
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
