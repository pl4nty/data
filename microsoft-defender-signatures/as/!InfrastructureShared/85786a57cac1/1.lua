-- Threat: !InfrastructureShared
-- Name: 85786a57cac1
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
