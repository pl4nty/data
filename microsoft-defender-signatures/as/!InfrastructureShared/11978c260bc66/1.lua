-- Threat: !InfrastructureShared
-- Name: 11978c260bc66
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
