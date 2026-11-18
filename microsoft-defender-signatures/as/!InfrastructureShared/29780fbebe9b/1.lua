-- Threat: !InfrastructureShared
-- Name: 29780fbebe9b
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
