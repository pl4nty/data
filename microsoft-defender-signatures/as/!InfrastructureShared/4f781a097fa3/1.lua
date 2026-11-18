-- Threat: !InfrastructureShared
-- Name: 4f781a097fa3
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
