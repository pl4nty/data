-- Threat: !InfrastructureShared
-- Name: 6d787ec15c91
-- Type: 21

if peattributes.isdll == true and peattributes.no_security == true then
  return mp.INFECTED
end
return mp.CLEAN
