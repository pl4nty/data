-- Threat: !InfrastructureShared
-- Name: 6778681d6545
-- Type: 21

if peattributes.no_security == true and peattributes.isdll == true then
  return mp.INFECTED
end
return mp.CLEAN
