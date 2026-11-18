-- Threat: !InfrastructureShared
-- Name: 937822e67c82
-- Type: 21

if peattributes.ismsil == true and peattributes.isexe == true then
  return mp.INFECTED
end
return mp.CLEAN
