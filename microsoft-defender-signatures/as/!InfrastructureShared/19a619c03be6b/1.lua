-- Threat: !InfrastructureShared
-- Name: 19a619c03be6b
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
