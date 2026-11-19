-- Threat: !InfrastructureShared
-- Name: 8778a08c4116
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
