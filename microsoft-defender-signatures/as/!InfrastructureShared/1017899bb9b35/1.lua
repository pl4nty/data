-- Threat: !InfrastructureShared
-- Name: 1017899bb9b35
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
