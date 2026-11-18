-- Threat: !InfrastructureShared
-- Name: 14e61e620f3dd
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
