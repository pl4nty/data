-- Threat: !InfrastructureShared
-- Name: 95406f8396c6
-- Type: 21

if peattributes.isexe == true and peattributes.ismsil == true then
  return mp.INFECTED
end
return mp.CLEAN
