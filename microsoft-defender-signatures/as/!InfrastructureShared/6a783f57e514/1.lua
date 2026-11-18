-- Threat: !InfrastructureShared
-- Name: 6a783f57e514
-- Type: 21

if peattributes.ismsil == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
