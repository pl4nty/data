-- Threat: !InfrastructureShared
-- Name: 7a7832041f10
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
