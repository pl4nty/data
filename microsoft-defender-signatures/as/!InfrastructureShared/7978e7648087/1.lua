-- Threat: !InfrastructureShared
-- Name: 7978e7648087
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
