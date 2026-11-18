-- Threat: !InfrastructureShared
-- Name: 86782453c2f3
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
