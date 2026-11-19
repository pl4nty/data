-- Threat: !InfrastructureShared
-- Name: 79782d29aeda
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
