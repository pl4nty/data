-- Threat: !InfrastructureShared
-- Name: 7678e03c6613
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
