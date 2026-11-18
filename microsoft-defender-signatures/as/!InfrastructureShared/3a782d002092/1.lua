-- Threat: !InfrastructureShared
-- Name: 3a782d002092
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
