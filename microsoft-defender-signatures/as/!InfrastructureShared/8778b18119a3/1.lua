-- Threat: !InfrastructureShared
-- Name: 8778b18119a3
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
