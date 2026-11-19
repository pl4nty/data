-- Threat: !InfrastructureShared
-- Name: 105404aa9d493
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
