-- Threat: !InfrastructureShared
-- Name: 7b78867caf66
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
