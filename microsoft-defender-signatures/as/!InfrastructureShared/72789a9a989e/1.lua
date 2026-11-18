-- Threat: !InfrastructureShared
-- Name: 72789a9a989e
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
