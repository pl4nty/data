-- Threat: !InfrastructureShared
-- Name: 40784fe793e6
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
